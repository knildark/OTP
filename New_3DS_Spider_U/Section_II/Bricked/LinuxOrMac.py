import mmap
import os

os.system('Resource/3DSFAT16tool -d -n emuNAND_bricked.bin ctr.bin ../../Section_I/Backup/nand.fat16.xorpad')
os.system('Resource/3DSFAT16tool -i -o emuNAND_bricked.bin ctr.bin ../../Section_I/Backup/nand.fat16.0x4.xorpad')
os.system('rm ctr.bin')

f1 = open("emuNAND_bricked.bin", "r+b")
f2 = open("Resource/NCSD_header_o3ds.bin", "r+b")

m1 = mmap.mmap(f1.fileno(), 0x200)
m2 = mmap.mmap(f2.fileno(), 0x200)

m1.seek(0)
m2.seek(0)

m1.write(m2.read(0x200))

m1.close()
m2.close()

os.system('mkdir Unbricked')
os.system('mv emuNAND_bricked.bin Unbricked/sysNAND.bin')
