SKSVERSION=$(grep "SKS64 Firmware" SKS64_SKETCH.ino|awk '{print $4}')
make --makefile Makefile.attiny85
make --makefile Makefile.attiny45
cp build-attinyx5-45/SKS64_SKETCH.hex SKS64_SKETCH_fw_"$SKSVERSION"_RGB_attiny45.hex
cp build-attinyx5-85/SKS64_SKETCH.hex SKS64_SKETCH_fw_"$SKSVERSION"_RGB_attiny85.hex
make --makefile Makefile.attiny85 clean
make --makefile Makefile.attiny45 clean

export CPPFLAGS=-DREDONLY
make --makefile Makefile.attiny85
make --makefile Makefile.attiny45
cp build-attinyx5-45/SKS64_SKETCH.hex SKS64_SKETCH_fw_"$SKSVERSION"_RED_attiny45.hex
cp build-attinyx5-85/SKS64_SKETCH.hex SKS64_SKETCH_fw_"$SKSVERSION"_RED_attiny85.hex
make --makefile Makefile.attiny85 clean
make --makefile Makefile.attiny45 clean
unset CPPFLAGS

