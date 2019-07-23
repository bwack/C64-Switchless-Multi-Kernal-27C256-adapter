README.txt

![logo](User&#32;Guide/media/SKS64-Logos-Ver2.png)

![3D_front](User&#32;Guide/media/Board_overview.png)

C64 Switchless Multi Kernel Switch
- 27C256/512 rom adapter for C64's

Designed by BWACK.
CERN OPEN HARDWARE LICENSE v1.2
http://www.ohwr.org/

The Eagle CAD files are available on GitHub:
https://github.com/bwack/C64-Switchless-Multi-Kernal-27C256-adapter

All text above must be included in any redistribution

# C64 Switchless (Quad) Kernal Switcher

This PCB can be used as a 28 to 24 pin EPROM adapter. With the ATTINY45/85 it is transformed into a kernal switcher. The RESTORE key works as normal, and with longer presses it can be used to switch kernals, or reset the machine. If you would like to tailor the adaptors behaviour to your liking, you can program it using the Arduino IDE.

Longboards (not 250469) and shortboards (250469) are sometimes found in both C64C and C64! You must open the machine to be 100% sure which motherboard you have. The Switchless Kernal Switcher for shortboards is based on Sven Petersen's [C64 Kernal Adaptor Switch shortboard](https://github.com/svenpetersen1965/C64-Kernal-Adaptor-Switch-short-board-). The old shortboard version is located at [DiscoHR's repository](https://github.com/discoHR/C64C-C128-multikernal-adapter). It is possible to use the original LED and cable assembly. This was an idea I found on [tebl's repository](https://github.com/tebl/C64-Kernal-Switcher).

# Programming
Programming is done with ISP programmers or High-Voltage programmers. You can use an Arduino Uno as ISP. Please see the User Guide for more information.

![3D_front](User&#32;Guide/media/programming_isp.png)

There is one single firmware for shortboard/longboard and 4/8 banks. These settings are stored in the EEPROM, and can be changed by holding RESTORE for 5s at power-on to enter the setup menu.

# EXROM reset
Some machine language programs change the way computer returns after a reset. In that case the only way to reset to basic is to turn the machine off. By controlling both RESET and EXROM it is possible to "cold start" the machine. Note: EXROM reset is only available when the ATtiny's RESET pin is disabled (fuse bit #RSTDISBL). This can only be done with HV-programmers (like TL866).

# ROM layout
ROM images are placed in 8k banks. In the longboard version place four kernals in a 32k image. In the shortboard version with ROM 27C256 place the basic image followed by 3 kernal images, or if ROM 27C512 is used place the basic image followed by 7 kernal images.

# Via locations
You can solder 1x1mm pin headers into motherboard vias to wire up RESTORE, RESET and EXROM.

![3D_front](User&#32;Guide/media/wiring_326298.png)
![3D_front](User&#32;Guide/media/wiring_250407.png)
![3D_front](User&#32;Guide/media/wiring_250425.png)
![3D_front](User&#32;Guide/media/wiring_250466.png)
![3D_front](User&#32;Guide/media/wiring_250469.png)

# Project links
- lemon64:  http://www.lemon64.com/forum/viewtopic.php?p=747333
- playlist: https://www.youtube.com/watch?v=oGaI8yLwjh4&list=PLtQOf_JULmrQTB7486X5pXG1Aaxbl_RdE
- OSH Park: https://oshpark.com/profiles/bwack
- Github:   https://github.com/bwack/C64-Switchless-Multi-Kernal-27C256-adapter

# Change log
## longboard version
- Rev 1.21 (2019-07-23):
  - Support 27C512 and 8 banks
- Rev 1.20 (2019-07-14):
  - Eagle -> KiCad.
  - PIC12F629 -> ATTINY45/85. Note: Pinout is different! Don't mix up PIC12F with ATTINY!
  - Programming with Arduino IDE.
  - Programmers: ISP: USBasp or Arduino UNO as ISP. High-Voltage: TL866.
  - Use the original LED or a common cathode RGB LED.
  - User Guide rewritten for this revision.
- Rev 1.13 (2016-09-28):
  - Moved IC2 down to clear space for the socket in the c64.
  - Changes to the silk screen.
- Rev 1.12 (2016-09-18):
  - Increased pad and hole sizes.
  - Removed ground fill from top layer.
  - Added CERN OHL v1.2 License.
- Rev 1.11 (2016-09-10):
  - RGB Led header following RGB led pinout (Blue-Green-GND-Red).
  - Edited silkscreen.
- Rev 1.1  (2016-09-08):
  - sch+brd.
  - Swapped signals #RESTORE and RED_LED. GP3 is input only.

## shortboard version
- Rev 1.0 (2019-07-18)
  - Initial design


Note: The schematic revision follows the board revision number.
