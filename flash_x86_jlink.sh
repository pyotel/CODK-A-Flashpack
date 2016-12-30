#!/bin/sh -e

#
# Script to flash Arduino 101 ARC core via JTAG and JLink
#
scriptdir=$(dirname $(readlink -f $0))

# Flash the board using JLink
$scriptdir/bin/openocd.l64 \
    -f $scriptdir/scripts/interface/ftdi/jlink.cfg \
    -f $scriptdir/scripts/board/quark_se.cfg \
    -f $scriptdir/scripts/flash-x86-jlink.cfg

if [ $? -ne 0 ]; then
    echo
    echo "***ERROR***"
    exit 1
else
    echo
    echo "!!!SUCCESS!!!"
fi
