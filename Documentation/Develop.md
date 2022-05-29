
# Develop

*Working with the boards.*

<br>
<br>


<img
    src = '../User%20Guide/media/programming_isp.png'
    height = 260
    align = right
/>

## Programming

You can either use a **ISP** or <br>
**High-Voltage** programmer.

*You can use an **Arduino UNO** as **ISP**.*

*After programming, the board must enter setup mode.*

*Please see the **[User Guide]** for more information.*


<br>
<br>
<br>

## ROM Layout

ROM images are placed in `8k` banks.

<br>

### C64 Longboard

- Place `4` kernals in a `32k` image ( `27C256` )

- Place `8` kernals in a `64k` image ( `W27C512` )

<br>

### C64 Shortboard

- Place `BASIC + 3` kernals in a `32k` image ( `27C256` )

- Place `BASIC + 7` kernals in a `64k` image ( `W27C512` )

<br>

### 1541

- Place `CBM DOS + JiffyDOS` in a `16k` image ( `27C128` )

<br>

### 1541C / 1541-II

- Place the ROM images in `16k` banks

- Place `KERNAL + CBMDOS / JiffyDOS` in a `32k` image ( `27C256` )


<br>
<br>
<br>

## Via Locations

*You can solder `1x1mm` pin headers into motherboard* <br>
*vias to wire up `RESTORE` , `RESET` and `EXROM` .*

<br>

<div align = center>

![Via 326298]
![Via 250407]
![Via 250425]
![Via 250466]
![Via 250469]

</div>

<br>


<!----------------------------------------------------------------------------->

[User Guide]: ../User%20Guide

[Via 326298]: ../User%20Guide/media/wiring_326298.png
[Via 250407]: ../User%20Guide/media/wiring_250407.png
[Via 250425]: ../User%20Guide/media/wiring_250425.png
[Via 250466]: ../User%20Guide/media/wiring_250466.png
[Via 250469]: ../User%20Guide/media/wiring_250469.png
