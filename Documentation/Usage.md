
# Usage

<br>
<br>

## Switching Kernel

The current selected Kernel is indicated by a color <br>
using the RGB LED as power LED replacement.

1. Hold the <kbd> RESTORE </kbd> key for several seconds.

2. Release it once the **LED** flashes.

3. Tab <kbd> RESTORE </kbd> until you get <br>
   the kernel (color) you want.

4. Wait a couple of seconds for the **C64** <br>
   to reset with the new kernel selected.

<br>

### 1541 Disk Drives

Now you can have the disk drive and <br>
the C64 switch at the same time!

The reset pulse issued by the SKS64 now <br>
has prepended serial data indicating the <br>
bank number.

When the SKS64 board in the disk drive <br>
is setup to 1541 mode, it will switch to <br>
the upper bank when the C64 is used <br>
with bank1, for example **[JiffyDOS]**.

<br>
<br>

## Resetting

1. Hold the <kbd> RESTORE </kbd> key for `2 Seconds`.

2. Release once the **LED** flashes.

3. Wait `2 Seconds` for the reset.

<br>
<br>

## EXROM Reset

*Optional*

Hold the <kbd> RESTORE </kbd> key for `5 Seconds`.

Some machine language programs change <br>
the way computer returns after a reset.

In that case the only way to reset <br>
to basic is to turn the machine off.

By controlling both `RESET` and `EXROM` <br>
it is possible to 'cold start' the machine.

<br>

#### Note

`EXROM` reset is only available when <br>
the **ATtiny's** `RESET` pin is disabled.

🠖 Fuse Bit #RSTDISBL

This can only be done with a High <br>
Voltage programmer like **TL866**.

<br>


<!----------------------------------------------------------------------------->

[JiffyDOS]: http://www.jiffydos.com/