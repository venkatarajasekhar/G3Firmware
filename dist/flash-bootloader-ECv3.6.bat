@ECHO OFF
:startBurn
echo Ready to load bootloader for Extruder v3.6.
pause

set port=usb
set firmware=ECv3.6\ATmegaBOOT_168_atmega328.hex
set programmer=usbtiny
set part=m328p

tools-win\avrdude -v -p%part% -P%port% -c%programmer% -e -Ulock:w:0x3F:m -Uefuse:w:0x05:m -Uhfuse:w:0xda:m -Ulfuse:w:0xff:m

tools-win\avrdude -v -p%part% -P%port% -c%programmer% -e -Uflash:w:%firmware%:i

if errorlevel 1 (
echo *** FAILURE *** Failed to verify program.  Try again.
)

goto startBurn
