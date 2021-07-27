 /*
 * SKS64 Firmware 1.4
 * C64 Switchless Kernal Switcher
 * Firmware for PCB V1.20 and up.
 * 
 * EXROM:
 * The firmware determines if EXROM reset is possible by
 * checking the fuse bit #RSTDISBL. If reset is disabled, then
 * ISP programming is no longer possible and a high-voltage
 * programmer is necessary.
 * 
 * Programming:
 * - Board: ATtiny25/45/85
 * - Processor: ATtiny85
 * - Clock: Internal 1 MHz
 * 
 * Select "Burn Bootloader". This function will write the
 * fusebits and set the ATTiny to 1 MHz. This is an illnamed
 * function. On the ATtiny there is no bootloader.
 * 
 *   Usage
 * ==========
 *  Assuming IDLE:
 *  - Hold RESTORE for 5s to perform EXROM-RESET (soft-reset).
 *  - Hold RESTORE for 2s to enter menu.
 *    - Tap RESTORE to change banks.
 *    - Machine resets 2s after releasing RESTORE (hard-reset).
 *    
 *   Setup
 * ===========
 * Select C64 motherboard type and 4 or 8 banks.
 *  - Turn on the computer while holding down the RESTORE key.
 *  - Hold it until the RGB LED starts flashing white twice.
 *  - Tap RESTORE to rotate setup
 *  - Hold RESTORE for about 5s to store setup
 *  
 *  Setup blinkys:
 *     1. LONG SHORT --> Longboard 4 banks
 *     2. LONG LONG  --> Longboard 8 banks
 *     3. SHORT SHORT --> Shortboard 4 banks
 *     4. SHORT LONG  --> Shortboard 8 banks
 *
 * History:
 * - 1.1 fixed: red led turned on when EXROM reset (flashcounter not zero)
 * - 1.2 fixed: Set EXROM to input on startup instead of output - otherwise EXROM is held high until first reboot. Thanks Darylrichards!
 * - 1.3 fixed: Removed led flashes at start of program. The delay caused the C64C to not warm start.
 * - 1.4 fixed: A15 always 0 at cold boot in 8 banks longboard mode.
 */

#include <avr/boot.h>
#include <avr/sleep.h>
#include <EEPROM.h>

#define USE_SLEEPMODE
//#define REDONLY

// I/O
#define RED 1
#define A13 4
#define A14 3
#define RESTORE 0
#define INTRST 2
#define EXROM 5

#define BANKS_EEPROM_ADDRESS 1
#define SHORTBOARD_EEPROM_ADDRESS 2

int exrom_available; // available if fuse bitshighBits 7 is active (low)
int eightmhz;
int counter, restore, last_press, flashcounter, flashdivision, inhibit;
int rom=0, banks, shortboard;
uint16_t flashpattern;

// state machine
#define STATE_INIT 4
#define STATE_SETUP 5
#define STATE_IDLE 0          // Stay in IDLE until RESTORE is held for 0.1s * PRESSTIME.
#define STATE_STILLHOLDING 1  // Continued holding RESTORE goto EXROMRESET, if released goto MENU.
#define STATE_MENU 2          // Single tap resets timeout and changes bank. Timeout goes to RESET.
#define STATE_RESET 3         // Resets machine and go back to IDLE.
#define STATE_EXROMRESET 7    // Resets machine with EXROM and go back to IDLE.
#define PRESSTIME 20   // Presstime in 0.1s to enter menu
#define HOLDTIME 30    // Press for PRESSTIME+HOLDTIME seconds to perform an EXROM-RESET
#define MENUTIMEOUT 20 // Timeout since last press of the restore in menu mode.
int state=STATE_INIT;
int next_state=STATE_INIT;

void system_sleep() {
  GIMSK |= _BV(PCIE); // pin change interrupt enable
  PCMSK |= _BV(PCINT0); // pin change interrupt on pin 0
  ADCSRA &= ~_BV(ADEN); // ADC off
  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here

  sleep_enable();
  sei();
  sleep_cpu();

  cli();
  PCMSK &= ~_BV(PCINT0);
  sleep_disable();
  ADCSRA |= _BV(ADEN);
  sei();
}

void flash_led(int led, int times, int duration) {
  for (int i=0; i<times; i++) {
    digitalWrite(led, HIGH);
    delay(duration);
    digitalWrite(led, LOW);
    delay(duration);
  }
}

void set_ledcolor(int _rom) {
  if (banks==8) {
    // in 8 bank mode, RED is tied to A15 and must be set by rom value
    digitalWrite(A13, _rom&0x01);
    digitalWrite(A14, _rom&0x02);
    digitalWrite(RED, _rom&0x04);
  }
  else if (banks==4) {
    // in 4 bank mode, RED is not tied to A15 and can be used freely
    if(_rom==0) {
      digitalWrite(A13, LOW);
      digitalWrite(A14, LOW);
      digitalWrite(RED, HIGH);
    } else {
      digitalWrite(A13, _rom&0x01);
      digitalWrite(A14, _rom&0x02);
      #ifdef REDONLY
      digitalWrite(RED, HIGH);
      #else
      digitalWrite(RED, LOW);
      #endif
    }
  }
}

void rotate_setup() {
  if      ( shortboard==0 && banks==4 ) { shortboard=0; banks=8; }
  else if ( shortboard==0 && banks==8 ) { shortboard=1; banks=4; }
  else if ( shortboard==1 && banks==4 ) { shortboard=1; banks=8; }
  else if ( shortboard==1 && banks==8 ) { shortboard=0; banks=4; }
}

void save_setup() {
  EEPROM.write(BANKS_EEPROM_ADDRESS, banks);
  delay(5);
  EEPROM.write(SHORTBOARD_EEPROM_ADDRESS, shortboard);
  delay(5);
}

void set_blinky_pattern() {
  if      ( shortboard==0 && banks==4 ) { flashpattern=0x9C00; }
  else if ( shortboard==0 && banks==8 ) { flashpattern=0xE700; }
  else if ( shortboard==1 && banks==4 ) { flashpattern=0x9000; }
  else if ( shortboard==1 && banks==8 ) { flashpattern=0xE400; }
}

void setup() {
  cli();
  uint8_t lowBits      = boot_lock_fuse_bits_get(GET_LOW_FUSE_BITS);
  uint8_t highBits     = boot_lock_fuse_bits_get(GET_HIGH_FUSE_BITS);
  //uint8_t extendedBits = boot_lock_fuse_bits_get(GET_EXTENDED_FUSE_BITS);
  //uint8_t lockBits     = boot_lock_fuse_bits_get(GET_LOCK_BITS);
  sei();
  exrom_available = ~highBits&0x80;
  eightmhz = lowBits&0x80;
  
  pinMode(RED, OUTPUT);
  pinMode(A13, OUTPUT);
  pinMode(A14, OUTPUT);
  pinMode(RESTORE, INPUT_PULLUP);
  pinMode(INTRST, INPUT);
  digitalWrite(RED, LOW);
  digitalWrite(A13, LOW);
  digitalWrite(A14, LOW);
  digitalWrite(INTRST, HIGH);
  if(exrom_available) {
    pinMode(EXROM, INPUT);
    digitalWrite(EXROM, HIGH);
  }

/*
 * show fuse bits on the red led by flashing for each digit
  char buf[4];
  snprintf(buf,sizeof(buf),"%3d",highBits);
    int i;
    for(int digit=0; digit<3; digit++) {
      for(i=0; i<buf[digit]-48; i++) {
        digitalWrite(A14, HIGH);
        delay(250);
        digitalWrite(A14, LOW);
        delay(250);
      }
      delay(1500); 
    }
    delay(2000); 
    delay(2000); 
*/

// software trap for forgotten to burn fusebits
  while(eightmhz) {
    flash_led(RED,1,2000);
    flash_led(RED,2,800);
    delay(4000);
  }

// poweron indicate EXROM availability
//  if(exrom_available)
//    flash_led(A13,2,50);
//  else
//    flash_led(A13,1,50);

  banks = EEPROM.read(BANKS_EEPROM_ADDRESS);
  if (banks==255) banks=4;
  shortboard = EEPROM.read(SHORTBOARD_EEPROM_ADDRESS);
  if(shortboard==255) shortboard=0;
  rom = EEPROM.read(0);
  if (banks==8) rom = rom&0x07;
  else if (banks==4) rom = rom&0x03;

  counter=0;
}

void loop() {
  restore = digitalRead(RESTORE);
  switch (state)
  {
    case STATE_INIT:
    if (restore==0) { 
      counter++;
      if(counter>50*2) {
        counter=0;
        next_state = STATE_SETUP;
        set_blinky_pattern();
        digitalWrite(RED, HIGH);
        inhibit=1;
      }
    } else {
      next_state = STATE_IDLE;
      counter=0;
    }
    break;

    case STATE_SETUP:
      if (restore==0) counter++;
      else counter=0;
      if(counter++>50*2) {
        counter=0;
        save_setup();
        next_state = STATE_IDLE;
      }
      else if (last_press==0 && restore==1) {
        if(!inhibit) rotate_setup();
        inhibit=0;
        set_blinky_pattern();
      }
      if (flashpattern==0) set_blinky_pattern();
    break;

    case STATE_IDLE:
      if (restore==0) counter++;
      else { 
        counter=0;
        #ifdef USE_SLEEPMODE
        if (flashcounter==0) system_sleep();
        #endif
      }
      if (counter>PRESSTIME*2) {
        next_state = STATE_STILLHOLDING;
        counter=0;
      }
      break;

    case STATE_STILLHOLDING:
      if (restore==0) {
        if(flashcounter==0) flashcounter = 2;
        counter++;
        if (counter>HOLDTIME*2) {
          next_state = STATE_EXROMRESET;
          counter=0;
        }
      } else {
        next_state = STATE_MENU;
        counter=0;
        last_press=0;
      }
      break;

     case STATE_MENU:
      if(counter++>MENUTIMEOUT*2) {
        counter=0;
        next_state = STATE_RESET;
      }
      else if (last_press==1 && restore==0) {
        rom++;
        if (shortboard) {
          if (rom>banks-1) rom=1;
          flashcounter = rom*2;
        } else {
          if (rom>banks-1) rom=0;
          flashcounter = (rom+1)*2;
        }
#ifndef REDONLY
        flashcounter=0;
#endif
 
        set_ledcolor(rom);
      }
      if (restore==0) counter=0;
      break;

    case STATE_RESET:
      flashcounter=0;
      set_ledcolor(rom);
      next_state = STATE_IDLE;
      digitalWrite(INTRST, LOW);
      pinMode(INTRST, OUTPUT);
      delay(300);
      pinMode(INTRST, INPUT);
      EEPROM.write(0, rom&0x07);
      delay(5);
      break;

    case STATE_EXROMRESET:
      flashcounter=0;
      set_ledcolor(rom);
      next_state = STATE_IDLE;
      digitalWrite(INTRST, LOW);
      pinMode(INTRST, OUTPUT);
      delay(100);
      if(exrom_available) {
        pinMode(EXROM, OUTPUT);
        digitalWrite(EXROM, LOW);
      }
      delay(300);
      pinMode(INTRST, INPUT);
      digitalWrite(INTRST, HIGH);
      delay(100);
      if(exrom_available) {
        pinMode(EXROM, INPUT);
        digitalWrite(EXROM, HIGH);

      }
      delay(300);

    default:
      break;

  }
  last_press = restore;
  state = next_state;

  // flash led ?
  if (flashcounter>0) {
    digitalWrite(RED, (flashcounter&0x01)==1);
    flashcounter--;
  } else if (flashpattern>0) {
    if(--flashdivision<=0) {
      digitalWrite(RED, (flashpattern&0x01)==1);
      digitalWrite(A13, (flashpattern&0x01)==1);
      digitalWrite(A14, (flashpattern&0x01)==1);
      flashpattern = flashpattern >> 1;
      flashdivision=2;
    }
  } else 
    set_ledcolor(rom);
  delay(50);
}

ISR(PCINT0_vect) {
}
 
