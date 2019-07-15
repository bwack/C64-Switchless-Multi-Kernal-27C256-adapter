/*
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
 */

#include <avr/boot.h>;

// I/O
#define RED 1
#define A13 4
#define A14 3
#define RESTORE 0
#define INTRST 2
#define EXROM 5

int exrom_available; // available if fuse bitshighBits 7 is active (low)
int eightmhz;
int counter, restore, last_press;
int rom=0;
#define STATE_IDLE 0
#define STATE_MENU 1
#define STATE_RESET 2
#define PRESSTIME 20
#define MENUTIMEOUT 20
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
  uint8_t extendedBits = boot_lock_fuse_bits_get(GET_EXTENDED_FUSE_BITS);
  uint8_t lockBits     = boot_lock_fuse_bits_get(GET_LOCK_BITS);
  sei();
  exrom_available = ~highBits&0x80;
  eightmhz = lowBits&0x80;
  
  pinMode(RED, OUTPUT);
  pinMode(A13, OUTPUT);
  pinMode(A14, OUTPUT);
  if(exrom_available) {
    pinMode(EXROM, OUTPUT);
    digitalWrite(EXROM, HIGH);
  }
  pinMode(RESTORE, INPUT_PULLUP);
  pinMode(INTRST, INPUT);
  digitalWrite(INTRST, HIGH);

  char buf[4];
  snprintf(buf,sizeof(buf),"%3d",highBits);

/*
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

// software trap:
  while(eightmhz) { // forgotten to burn fusebits
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
  
}

void loop() {
/*
  if (i==0) {
    flash_led(RED,1,100);
  }
  else {
    flash_led(RED,1,100);
    flash_led(INTRST,1,100);
    flash_led(A13,1,100);
    flash_led(A14,1,100);
  }
  */

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
        next_state = STATE_MENU;
        counter=0;
        last_press=0;
      }
      break;
      
    case STATE_MENU:
      digitalWrite(RED, HIGH);
      if(counter++>MENUTIMEOUT) {
        counter=0;
        next_state = STATE_RESET;
      }
      else if (last_press==1 && restore==0) {
        rom++;
        if (rom>3) rom=0;
      }
      if (restore==0) counter=0;
      break;

    case STATE_RESET:
      next_state = STATE_IDLE;
      digitalWrite(INTRST, LOW);
      delay(100);
      if(exrom_available) digitalWrite(EXROM, LOW);
      delay(300);
      digitalWrite(INTRST, HIGH);
      delay(100);
      if(exrom_available) digitalWrite(EXROM, HIGH);
      delay(300);

    default:
      break;

  }
  if (rom==1 || rom==3) digitalWrite(A13, HIGH);
  else digitalWrite(A13, LOW);
  if (rom==2 || rom==3) digitalWrite(A14, HIGH);
  else digitalWrite(A14, LOW);
  last_press = restore;
  state = next_state;    
  delay(100);
}
