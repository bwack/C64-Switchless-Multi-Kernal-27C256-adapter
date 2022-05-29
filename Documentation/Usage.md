# How it works

## Switching Kernals

The current selected Kernal is indicated by a color using the RGB LED as power LED replacement. Holding the RESTORE key for several seconds until the LED flashes. You then release it and tap RESTORE until you get the kernal (color) you want. Wait a couple of seconds and the C64 reset with the new kernal selected.

1541 disk drives:
Now you can have the disk drive and the C64 switch at the same time! The reset pulse issued by the SKS64 now has prepended serial data indicating the bank number. When the SKS64 board in the disk drive is setup in 1541 mode, it will switch to the upper bank when the C64 is switched to bank1 (for example, JiffyDOS).

## Reset

Hold the RESTORE key for two seconds. The LED flashes. Release and wait two seconds for the reset.

## EXROM Reset (optional)

Hold the RESTORE key for five seconds. Some machine language programs change the way computer returns after a reset. In that case the only way to reset to basic is to turn the machine off. By controlling both RESET and EXROM it is possible to "cold start" the machine.

Note: EXROM reset is only available when the ATtiny's RESET pin is disabled (fuse bit #RSTDISBL). This can only be done with HV-programmers (like TL866).