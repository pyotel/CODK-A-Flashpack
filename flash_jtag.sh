#!/bin/sh

OPENOCD="bin/openocd.l64"
if [ x"$(uname)" = x"Darwin" ]; then
    OPENOCD="bin_osx/openocd"
    export DYLD_LIBRARY_PATH=bin_osx:$DYLD_LIBRARY_PATH
elif [ x"$(uname -m)" = x"i686" ]; then
    OPENOCD="bin/openocd.l32"
fi

$OPENOCD -f scripts/interface/ftdi/flyswatter2.cfg -f scripts/board/quark_se.cfg -f scripts/flash-jtag.cfg
if [ $? -ne 0 ]; then
  echo
  echo "***ERROR***"
  exit 1
else
  echo
  echo "!!!SUCCESS!!!"
fi
