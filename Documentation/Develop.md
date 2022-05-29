
# Programming

Programming is done with ISP programmers or High-Voltage programmers. You can use an Arduino Uno as ISP. Please see the User Guide for more information.

![3D_front](User&#32;Guide/media/programming_isp.png)

After programming, the board must enter setup mode. Please refer to the User Guide.

# ROM layout

ROM images are placed in 8k banks.
- C64 Longboard
  - place 4 kernals in a 32k image (27C256).
  - place 8 kernals in a 64k image (W27C512).
- C64 Shortboard
  - place BASIC + 3 kernals in a 32k image (27C256).
  - place BASIC + 7 kernals in a 64k image (W27C512).
- 1541
  - Place CBM DOS + JiffyDOS in a 16k image (27C128)

For 1541C/1541-II ROM images are placed in 16k banks.
- 1541C/1541-II
  - Place KERNAL+CBMDOS + KERNAL+JiffyDOS in a 32k image (27C256)


# Via locations
You can solder 1x1mm pin headers into motherboard vias to wire up RESTORE, RESET and EXROM.

![3D_front](User&#32;Guide/media/wiring_326298.png)
![3D_front](User&#32;Guide/media/wiring_250407.png)
![3D_front](User&#32;Guide/media/wiring_250425.png)
![3D_front](User&#32;Guide/media/wiring_250466.png)
![3D_front](User&#32;Guide/media/wiring_250469.png)