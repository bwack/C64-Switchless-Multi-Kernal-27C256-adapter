// C64MultiKernel.c Rev 1.13.1 (2017-11-02)
// coded by BWACK in mikroC

// Multikernel switcher for the C64 breadbin/longboard
// a 2332 ROM to 27C256 ROM adapter with four kernels
// The microcontroller program flips through the four kernels at the press of
// restore key, in other words its a 'switchless' design.

// MCU: PIC12F629 or PIC12F675
// EasyPIC5 development board
// use any pic-programmer and load the .hex file with same name as your PIC

// Project settings:
// 4MHz Intosc - I/O on GP4
// All functions disabled (MCLR, brownout etc.)


// changes:
//   2017-11-02 Rev 1.13.1 - Added support for PIC12F675
//   2016-10-22 Rev 1.13 - putting the mcu to sleep
//   2016-09-17 Rev 1.12 - removed kernal=0. Switch-case state machine.

//#define DEBUG // uncomment this before debugging

// Inputs:
#define RESTORE_N GP3_bit
// Outputs:
#define RED_LED   GP2_bit
#define INTRST_N  GP1_bit // open-collector
// Addresses on GPIO B4 and B5

// finite state machine
#define IDLE_STATE 0
#define SELECT_STATE 2

char STATE=IDLE_STATE;
char buttontimer=0, old_button;
char kernalno=0;

void setkernal(char _kernal) {
  GP4_bit=0;
  GP5_bit=0;
  GPIO|=kernalno<<4;
#ifndef DEBUG
  EEPROM_Write(0x00,kernalno);
#endif
}

void intres(void) {
  INTRST_N=0;
  TRISIO.B1=0; // pull INTRES_N low
  RED_LED=~RED_LED;
  delay_ms(50);
  RED_LED=~RED_LED;
  delay_ms(200); // was 500
  TRISIO.B1=1; // release INTRES_N
  INTRST_N=1; // for the debugger
}

void setLED(void) {
  if(!GP4_bit && !GP5_bit) RED_LED= 1;
  else RED_LED=0;
}

void init(void) {
  char _i;
  OPTION_REG=0;
//  OPTION_REG=0b0001110; // about 1s watchdog timer.
  WPU.WPU1=1;
  CMCON=0x07; // digital IO
#ifdef P12F675
  ANSEL=0;
#endif
  
//ANSEL=0; // only defined for pic12f675
  TRISIO=0b00001011;
  INTRST_N=1;
  RESTORE_N=1;
  RED_LED=0;
#ifndef DEBUG
  kernalno=EEPROM_READ(0x00);
#endif
  GP3_bit=1; // presetting inputs for the debugger
  if(kernalno>3) kernalno=0; // incase EEPROM garbage.
  setkernal(kernalno);
  intres();

  IOC = 0b00001010; // GPIO interrupt-on-change mask
  GPIE_bit=1;       // GPIO Interrupt enable, on
  GIE_bit=0;        // Globale interrupt enable, off

  for(_i=0; _i<5; _i++) {
    //asm { CLRWDT };
    RED_LED=1;
    delay_ms(50);
    RED_LED=0;
    delay_ms(50);
  }
}

void main() {
  char i;
//  asm { CLRWDT };
  init();

  while(1) {
      setLED();

    switch(STATE) {

      case IDLE_STATE:

        if(!RESTORE_N || !INTRST_N)
          buttontimer++;
        else {
          buttontimer=0;
          asm {sleep};
          GPIF_bit=0;
        }
        delay_ms(100);
        if (buttontimer>15) { STATE=SELECT_STATE; old_button=0; buttontimer=0;
          RED_LED=~RED_LED;
          delay_ms(50);                 //
          RED_LED=~RED_LED;
          delay_ms(50);
        }
        break;

      case SELECT_STATE:

        if(!old_button && RESTORE_N && INTRST_N ) {
          old_button=1;
          delay_ms(20);
        }
        if(old_button && (!RESTORE_N || !INTRST_N) ) {
          old_button=0;
          kernalno++;
          kernalno&=0x03;
          setkernal(kernalno);
          delay_ms(20);
        }
        if( RESTORE_N && INTRST_N ) {
          i=0;
          buttontimer++;
          delay_ms(50);
        } else buttontimer=0;
        if (buttontimer>30) {
          STATE=IDLE_STATE;
          old_button=1;
          intres();
          buttontimer=0;
        }
        break;

      default:
        break;
    }
  }
}