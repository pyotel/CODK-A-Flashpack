#!/bin/sh -e

#
# Script to flash Arduino 101 ARC core via JTAG and Flyswatter2
#
scriptdir=$(dirname $(readlink -f $0))

# Flash the board using JTAG
$scriptdir/bin/openocd.l64 \
    -c "set arc_bin $1" \
    -f $scriptdir/scripts/interface/ftdi/flyswatter2.cfg \
    -f $scriptdir/scripts/board/quark_se.cfg \
    -f $scriptdir/scripts/flash-arc-jtag.cfg

if [ $? -ne 0 ]; then
    echo
    echo "***ERROR***"
    exit 1
else
    echo
    echo "!!!SUCCESS!!!"
fi
