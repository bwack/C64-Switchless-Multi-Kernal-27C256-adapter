 /*
 * SKS64 Firmware ported to the Arduino UNO. based on SKS64 Firmware V1.6
 * C64 Switchless Kernal Switcher
 * 
 * Programming:
 * - Board: Arduino Uno
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
 *     1. LONG SHORT  --> Longboard 4 banks
 *     2. LONG LONG   --> Longboard 8 banks
 *     3. SHORT SHORT --> Shortboard 4 banks
 *     4. SHORT LONG  --> Shortboard 8 banks
 *     5. LOOONG      --> 1541C/1541-II 2 banks
 *
 * History:
 * - 1.1 fixed: red led turned on when EXROM reset (flashcounter not zero)
 * - 1.2 fixed: Set EXROM to input on startup instead of output - otherwise EXROM is held high until first reboot. Thanks Darylrichards!
 * - 1.3 fixed: Removed led flashes at start of program. The delay caused the C64C to not warm start.
 * - 1.4 fixed: A15 always 0 at cold boot in 8 banks longboard mode.
 * - 1.5 new: 1541 mode (2*16k banks). Goes to upper bank when the C64 is in bank1 (jiffydos), and lower bank elsewise.
 * - 1.6 removed startup delay (1s) causing startup issues.
 */

#include <avr/boot.h>
#include <avr/sleep.h>
#include "NeoSWSerial.h"
#include <EEPROM.h>

//#define USE_SLEEPMODE
//#define REDONLY

// I/O
#define RESTORE 8
#define RED 9
#define A13 10
#define A14 11
#define INTRST 7
#define EXROM 6

#define EEPROM_ADDRESS_MODE 1

int exrom_available; // available if fuse bitshighBits 7 is active (low)
int eightmhz;
int counter=0, restore=1, last_press, flashcounter=0, flashdivision, inhibit;
int rom=0, mode=0;
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

NeoSWSerial ss( INTRST, INTRST );

volatile uint32_t newlines = 0UL;

static void handleRxChar( uint8_t c )
{
  if (c == '\n')
  newlines++;
}

enum {
  LONGBOARD_4BANKS = 0,
  LONGBOARD_8BANKS,
  SHORTBOARD_3BANKS,
  SHORTBOARD_7BANKS,
  C1541C_1541II,
  MAX_MODES
};

void system_sleep() {
// see http://www.getelectronics.net/arduino-uno-pinout-schematics-and-pin-descriptions.php
// and page56 here https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf
  //PCMSK0 |= bit (PCINT0);
  //PCICR |= bit (PCIE0);
  ADCSRA &= ~_BV(ADEN); // ADC off
  set_sleep_mode(SLEEP_MODE_PWR_DOWN); // sleep mode is set here
  sleep_enable();
  sei();
  sleep_cpu();

  // cpu wakes up here
  cli();
  PCMSK0 &= ~ bit (PCINT0);
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
  if (mode==C1541C_1541II) {
    if (_rom == 1) {
      digitalWrite(A13, LOW);
      digitalWrite(A14, HIGH);
      digitalWrite(RED, LOW);
    } else {
      digitalWrite(A13, HIGH);
      digitalWrite(A14, LOW);
      digitalWrite(RED, LOW);
    }
  }
  else if (mode==LONGBOARD_8BANKS || mode==SHORTBOARD_7BANKS) {
    // RED is tied to A15 and must be set by rom value
    digitalWrite(A13, _rom&0x01);
    digitalWrite(A14, _rom&0x02);
    digitalWrite(RED, _rom&0x04);
  }
  else if (mode==LONGBOARD_4BANKS || mode==SHORTBOARD_3BANKS) {
    // in 4 bank mode, RED is not tied to A15 and can be used freely
    // In 4 bank mode you are supposed to use *256 ROMS or weird stuff happens.
    // but it is possible to use a *512, just remember to put bank0 at bank4.
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
  mode++;
  if (mode>=MAX_MODES) mode=0;
}

void rotate_rom() {
  rom++;
  int highestbank=0, startat=0;
  switch (mode) {
    case LONGBOARD_8BANKS:
      highestbank=7;
      startat=0;
      break;
    case LONGBOARD_4BANKS:
      highestbank=3;
      startat=0;
      break;
    case SHORTBOARD_7BANKS:
      highestbank=7;
      startat=1;
      break;
    case SHORTBOARD_3BANKS:
      highestbank=3;
      startat=1; // because 0 is BASIC
      break;
    case C1541C_1541II:
      highestbank=1;
      startat=0;
      break;
  }

  if (rom>highestbank)
    rom = startat;

  flashcounter = rom*2;
  if (mode==LONGBOARD_8BANKS||mode==LONGBOARD_4BANKS) {
    flashcounter = (rom+1)*2;
  }
}

void load_setup() {
  mode = EEPROM.read(EEPROM_ADDRESS_MODE);
  if (mode>=MAX_MODES) mode=0;
  rom = EEPROM.read(0);
  rom = rom&0x07;
}

void save_setup() {
  EEPROM.write(EEPROM_ADDRESS_MODE, mode);
  delay(5);
}

void set_blinky_pattern() {
  if      ( mode==LONGBOARD_4BANKS )  { flashpattern=0x9C00; }
  else if ( mode==LONGBOARD_8BANKS )  { flashpattern=0xE700; }
  else if ( mode==SHORTBOARD_3BANKS ) { flashpattern=0x9000; }
  else if ( mode==SHORTBOARD_7BANKS ) { flashpattern=0xE400; }
  else if ( mode==C1541C_1541II )     { flashpattern=0xF7FF; }
  else { flashpattern=0x1000; }
}

void setup() {
  //sei();

  pinMode(RED, OUTPUT);
  pinMode(A13, OUTPUT);
  pinMode(A14, OUTPUT);
  pinMode(RESTORE, INPUT_PULLUP);
  pinMode(INTRST, INPUT);
  digitalWrite(RED, LOW);
  digitalWrite(A13, LOW);
  digitalWrite(A14, LOW);
                                                                                                                                                                                                                                                                                                                                                                                digitalWrite(INTRST, HIGH);

  pinMode(EXROM, INPUT);
  digitalWrite(EXROM, HIGH);

  //ss.attachInterrupt( handleRxChar );
  ss.begin( 19200 );

// poweron indicate EXROM availability
//  if(exrom_available)
//    flash_led(A13,2,50);
//  else
//    flash_led(A13,1,50);

  load_setup();

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
        rotate_rom();

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
      ss.ignore();
      ss.write(0xde);
      ss.write(rom);
      pinMode(INTRST, OUTPUT);
      digitalWrite(INTRST, LOW);
      delay(300);
      pinMode(INTRST, INPUT);
      ss.listen();
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

      pinMode(EXROM, OUTPUT);
      digitalWrite(EXROM, LOW);
      delay(300);
      
      pinMode(INTRST, INPUT);
      digitalWrite(INTRST, HIGH);
      delay(100);

      pinMode(EXROM, INPUT);
      digitalWrite(EXROM, HIGH);
      EEPROM.write(0, rom&0x07);
      delay(300);

    default:
      break;

  }
  last_press = restore;
  state = next_state;

  while (ss.available()) {
    uint8_t data = ss.read();
    if (data==0xde) {
      delay(1);
      if (ss.available()) {
        rom=(ss.read());
        flashcounter=0;
        set_ledcolor(rom);
      }
    }
  }

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
