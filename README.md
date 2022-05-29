
[![Badge License]][License]

<br>

![Logo]

<br>

<div align = center>

***A C64 + Disk Drives Switch-less Multi*** <br>
***Kernel ROM Adapter / Switcher***

<br>

---

[![Button Playlist]][Playlist]   
[![Button OSHPark]][OSHPark]   
[![Button Forum]][Forum]   
[![Button Changelog]][Changelog]

---

</div>

<br>
<br>

![Preview]

<br>

## Supported Devices

![C64]  ![C64C]  ![1541]  ![1541C]  ![1541-II] 

<br>

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

# Hardware

There are two different PCBs for the SKS64.
- "longboard": works with C64 longboards and 1541/1541Late.
- "shortboard": works with C64C shortboards and 1541C/1541-II.

Note: The internals of C64/C64C and 1541/1541C are often mixed up, and you must look inside their cases to be sure which boards they have.

Gerbers and hex-files (for programming) are found under the release-tab above.

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

# Acknowledgement

The Switchless Kernal Switcher for shortboards is based on Sven Petersen's [C64 Kernal Adaptor Switch shortboard](https://github.com/svenpetersen1965/C64-Kernal-Adaptor-Switch-short-board-). The old shortboard version is located at [DiscoHR's repository](https://github.com/discoHR/C64C-C128-multikernal-adapter). It is possible to use the original LED and cable assembly. This was an idea I found on [tebl's repository](https://github.com/tebl/C64-Kernal-Switcher).

<br>


<!----------------------------------------------------------------------------->

[Playlist]: https://www.youtube.com/playlist?list=PLtQOf_JULmrQTB7486X5pXG1Aaxbl_RdE
[OSHPark]: https://oshpark.com/profiles/bwack 'Order The Board'
[Forum]: http://www.lemon64.com/forum/viewtopic.php?p=747333 'Lemon64 Forum Post'

[Changelog]: Documentation/Changelog.md
[Preview]: User%20Guide/media/Board_overview.png
[License]: LICENSE
[Logo]: User%20Guide/media/SKS64-Logos-Ver2.png

[Badge License]: https://img.shields.io/badge/Open_Hardware-1.2-292961?style=for-the-badge


<!--------------------------------{ Devices }---------------------------------->

[1541-II]: https://img.shields.io/badge/１５４１－ＩＩ-d7cdbb?style=flat
[1541C]: https://img.shields.io/badge/１５４１Ｃ-d7cdbb?style=flat
[1541]: https://img.shields.io/badge/１５４１-d7cdbb?style=flat
[C64C]: https://img.shields.io/badge/Ｃ６４Ｃ-d7cdbb?style=flat
[C64]: https://img.shields.io/badge/Ｃ６４-d7cdbb?style=flat


<!--------------------------------{ Buttons }---------------------------------->

[Button Changelog]: https://img.shields.io/badge/Changelog-19abdd?style=for-the-badge&logoColor=white&logo=AzureArtifacts
[Button Playlist]: https://img.shields.io/badge/Playlist-d13434?style=for-the-badge&logoColor=white&logo=Youtube
[Button OSHPark]: https://img.shields.io/badge/OSHPark-752c8d?style=for-the-badge&logoColor=white&logo=Houzz
[Button Forum]: https://img.shields.io/badge/Forum-5287B8?style=for-the-badge
