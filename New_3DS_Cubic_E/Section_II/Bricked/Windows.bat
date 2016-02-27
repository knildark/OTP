@echo off

if exist ../../Section_I/Backup/nand.fat16.xorpad (
    echo "Found nand.fat16.xorpad!"
) else (
    echo "Could not find nand.fat16.xorpad in Section_I/Backup!"
    EXIT /B
)

if exist ../../Section_I/Backup/nand.fat16.0x4.xorpad (
    echo "Found nand.fat16.0x4.xorpad!"
) else (
    echo "Could not find nand.fat16.0x4.xorpad in Section_I/Backup!"
    EXIT /B
)

if exist Unbricked/sysNAND.bin (
    echo "Removing previous unbrick..."
    del Unbricked/sysNAND.bin
    rmdir Unbricked
) else (
    echo "No previous unbrick found..."
)


move emuNAND_bricked.bin Resource/
cd Resource/

echo "Copying emuNAND, please wait..."
copy emuNAND_bricked.bin sysNAND.bin

3DSFAT16tool.exe -d -n sysNAND.bin ctr.bin ../../../Section_I/Backup/nand.fat16.xorpad
3DSFAT16tool.exe -i -o sysNAND.bin ctr.bin ../../../Section_I/Backup/nand.fat16.0x4.xorpad

dd.exe conv=notrunc if=NCSD_header_o3ds.bin of=sysNAND.bin

cd ..

mkdir Unbricked

move Resource\sysNAND.bin Unbricked\sysNAND.bin
move Resource\emuNAND_bricked.bin .

pause
