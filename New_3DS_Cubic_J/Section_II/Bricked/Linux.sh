#!/bin/sh

if [ ! -f ../../Section_I/Backup/nand.fat16.xorpad ]; then
    echo "Could not find nand.fat16.xorpad in Section_I/Backup!"
    exit 1
fi

echo "Found nand.fat16.xorpad!"

if [ ! -f ../../Section_I/Backup/nand.fat16.0x4.xorpad ]; then
    echo "Could not find nand.fat16.0x4.xorpad in Section_I/Backup!"
    exit 1
fi

echo "Found nand.fat16.0x4.xorpad!"

if [ -f Unbricked/sysNAND.bin ]; then
    echo "Removing previous unbrick..."
    rm Unbricked/sysNAND.bin
    rmdir Unbricked
fi

mv emuNAND_bricked.bin Resource/
cd Resource/

echo "Copying emuNAND, please wait..."
cp emuNAND_bricked.bin sysNAND.bin

./3DSFAT16tool_Linux -d sysNAND.bin ctr.bin ../../../Section_I/Backup/nand.fat16.xorpad
./3DSFAT16tool_Linux -i sysNAND.bin ctr.bin ../../../Section_I/Backup/nand.fat16.0x4.xorpad

dd conv=notrunc if=NCSD_header_o3ds.bin of=sysNAND.bin

cd ..

mkdir Unbricked

mv Resource/sysNAND.bin Unbricked/sysNAND.bin
mv Resource/emuNAND_bricked.bin .
