README.txt

![logo](User&#32;Guide/media/SKS64-Logos-Ver2.png)

![3D_front](User&#32;Guide/media/Board_overview.png)

C64 Switchless Multi Kernel Switch
- 27C256 rom adapter for C64's with long motherboard

Designed by BWACK.
CERN OPEN HARDWARE LICENSE v1.2
http://www.ohwr.org/

The Eagle CAD files are available on GitHub:
https://github.com/bwack/C64-Switchless-Multi-Kernal-27C256-adapter

All text above must be included in any redistribution

# C64 Switchless Quad Kernal Switcher
(C64 longboard version)

This PCB can be used as a 28 to 24 pin EPROM adapter. With the ATTINY45/85 it is transformed into a kernal switcher. You can program it using Arduino to switch between four C64 kernals.

Longboards (not 250469) and shortboards (250469) are sometimes mixed up with C64C and C64! You must open the machine up to be sure which motherboard you have. The Switchless Kernal Switcher for shortboards is based on the longboard version, and Sven Petersen's [C64 Kernal Adaptor Switch shortboard](https://github.com/svenpetersen1965/C64-Kernal-Adaptor-Switch-short-board-). The old shortboard version is located at [DiscoHR's repository](https://github.com/discoHR/C64C-C128-multikernal-adapter). 

In 1.20 of this project it is possible to use the original LED and cable assembly. This was an idea I found on tebl's repository based on this design.  https://github.com/tebl/C64-Kernal-Switcher

# Programming
It can be programmed with ISP programmers. You can use an Arduino Uno as ISP. Base your firmware selection on longboard version, shortboard version and ROM layout. Please see the User Guide for more information regarding build and programming.

![3D_front](User&#32;Guide/media/programming_isp.png)

# ROM layout
ROM images are placed in 8k banks.
## longboard version
Place four kernals in a 32k image.
## shortboard version
ROM 27C256: basic image followed by 3 kernal images.
ROM 27C512: basic image followed by 7 kernal images.

# Via locations
You can solder 1x1mm pin headers into vias to wire up RESTORE, RESET and EXROM.

![3D_front](User&#32;Guide/media/wiring_326298.png)
![3D_front](User&#32;Guide/media/wiring_250407.png)
![3D_front](User&#32;Guide/media/wiring_250425.png)
![3D_front](User&#32;Guide/media/wiring_250466.png)

# Project links
- lemon64:  http://www.lemon64.com/forum/viewtopic.php?p=747333
- playlist: https://www.youtube.com/watch?v=oGaI8yLwjh4&list=PLtQOf_JULmrQTB7486X5pXG1Aaxbl_RdE
- OSH Park: https://oshpark.com/profiles/bwack
- Github:   https://github.com/bwack/C64-Switchless-Multi-Kernal-27C256-adapter

# Change log
## long board version
- Rev 1.20 (2019-07-14):
  - Eagle -> KiCad.
  - PIC12F629 -> ATTINY45/85. Note: Pinout is different! Don't mix up PIC12F with ATTINY!
  - Programming with Arduino IDE, using USBasp or Arduino UNO as ISP.
  - Use the original LED or a common cathode RGB LED.
  - User Guide rewritten for this revision.
- Rev 1.13 (2016-09-28):
  - Moved IC2 down to clear space for the socket in the c64.
  - Changes to the silk screen.
- Rev 1.12 (2016-09-18):
  - Increased padd and hole sizes.
  - Removed ground fill from top layer.
  - Added CERN OHL v1.2 License.
- Rev 1.11 (2016-09-10):
  - RGB Led header following RGB led pinout (Blue-Green-GND-Red).
  - Editted silkscreen.
- Rev 1.1  (2016-09-08):
  - sch+brd.
  - Swapped signals #RESTORE and RED_LED. GP3 is input only.

## short board version
- Rev 1.0 (2019-07-18)
  - Initial design


Note: The schematic revision follows the board revision number.
