 /*
 * C64 Switchsless Quad Kernal Switcher
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
 * Usage:
 *  Assuming IDLE:
 *  - Hold RESTORE for 5s to perform EXROM-RESET (soft-reset).
 *  - Hold RESTORE for 2s to enter menu.
 *    - Tap RESTORE to change banks.
 *    - Machine resets 2s after releasing RESTORE (hard-reset).
 *
 */

#include <avr/boot.h>
#include <EEPROM.h>

// I/O
#define RED 1
#define A13 4
#define A14 3
#define RESTORE 0
#define INTRST 2
#define EXROM 5

int exrom_available; // available if fuse bitshighBits 7 is active (low)
int eightmhz;
int counter, restore, last_press, flashcounter;
int rom=0;

// state machine
#define STATE_IDLE 0          // Stay in IDLE until RESTORE is held for 0.1s * PRESSTIME.
#define STATE_STILLHOLDING 1  // Continued holding RESTORE goto EXROMRESET, if released goto MENU.
#define STATE_MENU 2          // Single tap resets timeout and changes bank. Timeout goes to RESET.
#define STATE_RESET 3         // Resets machine and go back to IDLE.
#define STATE_EXROMRESET 4    // Resets machine with EXROM and go back to IDLE.
#define PRESSTIME 20   // Presstime in 0.1s to enter menu
#define HOLDTIME 30    // Press for PRESSTIME+HOLDTIME seconds to perform an EXROM-RESET
#define MENUTIMEOUT 20 // Timeout since last press of the restore in menu mode.
int state=STATE_IDLE;
int next_state=STATE_IDLE;

void flash_led(int led, int times, int duration) {
  for (int i=0; i<times; i++) {
    digitalWrite(led, HIGH);
    delay(duration);
    digitalWrite(led, LOW);
    delay(duration);
  }
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
    pinMode(EXROM, OUTPUT);
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
    flash_led(A13,1,2000);
    flash_led(A13,2,800);
    delay(4000);
  }

// poweron indicate EXROM availability
  delay(500);
  if(exrom_available)
    flash_led(A13,2,100);
  else
    flash_led(A13,1,200);
  delay(500);

  rom = EEPROM.read(0) & 0x03;

  counter=0;
}

void loop() {
  restore = digitalRead(RESTORE);
  switch (state)
  {
    case STATE_IDLE:
      digitalWrite(RED, LOW);
      if (restore==0)
        counter++;
      else
        counter=0;
      if (counter>PRESSTIME) {
        next_state = STATE_STILLHOLDING;
        counter=0;
      }
      break;

    case STATE_STILLHOLDING:
      if (restore==0) {
        digitalWrite(RED, !digitalRead(RED));
        counter++;
        if (counter>HOLDTIME) {
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
      if(counter++>MENUTIMEOUT) {
        counter=0;
        next_state = STATE_RESET;
      }
      else if (last_press==1 && restore==0) {
        rom++;
        if (rom>3) rom=0;
        flashcounter = (rom+1)*2;
      }
      if (restore==0) counter=0;
      break;

    case STATE_RESET:
      next_state = STATE_IDLE;
      digitalWrite(INTRST, LOW);
      pinMode(INTRST, OUTPUT);
      delay(300);
      pinMode(INTRST, INPUT);
      EEPROM.write(0, rom&0x03);
      delay(5);
      break;

    case STATE_EXROMRESET:
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
  if (rom&0x01) digitalWrite(A13, HIGH);
  else digitalWrite(A13, LOW);
  if (rom&0x02) digitalWrite(A14, HIGH);
  else digitalWrite(A14, LOW);
  last_press = restore;
  state = next_state;    
  delay(100);

  // flash led ?
  if (flashcounter>0) {
    digitalWrite(RED, (flashcounter&0x01)==1);
    flashcounter--;
  }
}
