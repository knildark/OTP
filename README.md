*While not a requirement anymore, a hardmod is still recommended.*

## Introduction

This is, to the best of my knowledge, the first public comprehensive guide to getting the console specific OTP for the 3DS.

This guide will take you through the steps of downgrading to version 2.1 to get the OTP, which was blocked from our reach with the release of 3.X (without some hardware trickery).

**This guide will work on New 3DS, Old 3DS, and 2DS in the U, E, and J regions. The C, K, and T regions shipped with version 4.X which is after the OTP lockout, and as such *cannot* downgrade far enough to use this guide.**

C, K, and T regions may be able to switch to U, E, or J temporarily but that is outside of the scope of this guide.

The method for dumping the OTP without a hardmod (relatively) safely was originally created by me and was influenced by conversations with AHP_Person, Normmatt, and Vappy. The guide was based off my own personal notes you can see [here](https://www.irccloud.com/pastebin/SfsLwHWS/OTP+Notes) and was created from start to finish in about 14 days.

This guide was written by me with the process refined and software developed by the fine folks over at #Cakey on Freenode. See the bottom of this page for the full credits, this guide would not exist without them.

## Abstract

The OTP it a 0x100 byte region of seemingly random data at address 0x10012000. It is presumed that console unique keys are derived from this region, although it is currently unknown exactly how. The region is likely the console unique data store which is decrypted by the bootrom, but we don't know how that is done until somebody dumps the full protected bootrom. It is unknown at this time if anyone has successfully dumped the protected bootrom.

Prior to version 3.0.0-X, Nintendo locked access to this region using Kernel9, presumably under the assumption that an attacker would never gain access to arm9 userland (as arm9 kernel and userland are functionally identical thanks to svc 0x7B).

After version 3.0.0-X, Nintendo switched to locking this region using the register CFG_SYSPROT9, which also locks the bootloader and is set extremely early in boot, long before we are able to gain code execution. This register can be set exactly once, and cannot be switched off until the unit is fully powered off, and therefore it is impossible to dump the full OTP without a version 2.1.0-X or below.

There is, however, a method to dump the hash of the OTP on version 9.6.0-X. Because Kernel9Loader does not clear the SHA_HASH register after it has been used, dumping the SHA_HASH will give the hash of the OTP which was handed over to Kernel9 from Kernel9Loader. In addition, there is a long standing vulnerability where an MCU reboot caused by the i2c will not clear RAM like it's supposed to.

This allows for a hardware based attack where arbitrary data is written to nand_sector96+0x10 in a sysNAND backup and flashed to the device. Afterwards we wire the i2c to MCU reboot on our command, write a payload (which will write 0x1000A040 - 0x1000A060 to a file on the SD card) to arm9 memory somewhere, fill all memory with a NOP sled followed by a JMP instruction pointing to the payload. We can then MCU reboot repeatedly (incrementing nand_sector96+0x10 by 1 each time) until the Kernel9Loader jumps to the payload by random chance.

Because of the complexity and extra hardware involved in the method described above, I have decided to limit the scope of this guide strictly to the software based approach of downgrading to a version below 3.0.0-X. Version 2.1.0-X was selected because it is the only version below 3.0.0-X that contains a fully exploitable browser version (2.0.0-X has a partially exploitable browser, but it won't work for other reasons).

This guide will take you through the process of downgrading you emuNAND to 2.1.0-X to ensure you do not get a partial downgrade (which is when some titles are on one version and others are on a different version) which are difficult to recover from. On the New 3DS you must then decrypt with your console's 0x5 xorpad (which is New 3DS only) and then reencrypt with your console's 0x4 xorpad. Afterwards you overwrite the New 3DS's NAND NCSD (the header that specifies each partition's location) with the NCSD from an Old 3DS and flash the emuNAND to sysNAND. These steps are unneeded on an Old 3DS.

## FAQ / TL;DR

+ *What is the OTP?* -
  The OTP is a console unique region from which console specific keys seem to be derived, although it is unknown how. More info here: https://3dbrew.org/wiki/OTP_Registers
+ *What can I do with my OTP?* -
  The OTP is a requirement to use Arm9loaderhax, which gets you, among other things, 100% boot rate, emuNAND boot speed almost as fast as regular sysNAND (using something like AuReiNand), and very early Arm9 access. In the future, this will allow for running things like Decrypt9 to unbrick yourself without a hardmod and other awesome tools.
+ *Why do we have to downgrade to get it?* -
  Since version 3.0, the OTP is locked out early in sysNAND boot. There is a New 3DS only exploit that works on 9.6, but it requires extra hardware. The solution we are using is to downgrade emuNAND (to ensure we don't partial downgrade) to 2.1, then flash emuNAND to sysNAND to get the OTP.
+ *What version do I have to be on?* -
  This guide assumes 9.2; any lower version may work, but you're on your own for that.
+ *What's the current brick rate?* -
  This guide should work without a hardmod safely as long as you follow all instructions.

## Get Started

*Click the appropriate link below:*

New 3DS | Old 3DS / 2DS
:---: | :---:
[With Cubic Ninja](https://github.com/Plailect/OTP/blob/master/New_3DS_Cubic.md) | [With Cubic Ninja](https://github.com/Plailect/OTP/blob/master/Old_3DS_Cubic.md)
[Without Cubic Ninja](https://github.com/Plailect/OTP/blob/master/New_3DS_Spider.md) | [Without Cubic Ninja](https://github.com/Plailect/OTP/blob/master/Old_3DS_Spider.md)

Pack .zip | SHA-256
:---: | :---:
New_3DS_Cubic_E | e2a8bff2886d1e02c2b6a71ae32031144891708cbbbfd300a06e18b428e144d2
New_3DS_Cubic_J | 74cb7639e51bafa1c36c9d1892ac4ed7da455c535e6afb4cc551d654298bf28e
New_3DS_Cubic_U | b686ec91cdb23969a791634b9691659b8b87d89b0e0f99fbd54eb861e06659ce
New_3DS_Spider_E | ecd054bfc9fe34241199681b40d42dd3f9dd8b06e74755ec680c6098a3f3aab8
New_3DS_Spider_J | 2e7eb2d27db11ef97832ae3472930b4b1a95e6805a83eae9bbfe94ae35ee1a89
New_3DS_Spider_U | c0478c1c7b5a82bdaf18b2cc2e892758082f29a62c7d7ea57f02b538976b6ac2
Old_3DS_Cubic_E | 32debaf3d87205ac8de2d60a53028ba524d3b1544ca966299bd2090003140a9c
Old_3DS_Cubic_J | 809d6b07e229a40a02d9e1800ad1e6381073959d4cac567c31cdbe52174c96a4
Old_3DS_Cubic_U | d524166320b396e880f8c20b75e5c1a6e2ac5d51a6e7d1bf98c7d6388c5f8ebe
Old_3DS_Spider_E | b421d0265a26f0bdedaaf0112ecb1c9bbe0a5a2d4cd2a29dd7f09e0e5de51fa1
Old_3DS_Spider_J | 00ad5a9450ee8679311c2ee72a5aa092feaf490f606a4c16c64b5560d81af709
Old_3DS_Spider_U | 12f690d6d1ed58e851d86b9c664e7be59994d997f57ffb85aabcf1746cb65e14

## Credits

+ AHP_Person for code.bin
+ Normmatt for load.bin
+ yellows8 for answering my questions
+ b1l1s (he's back baby) for being fucking amazing
+ mid-kid for letting us use his channel
+ Gelex for being fucking amazing
+ dank101 for testing
+ Vappy for emotional support
+ MassExplosion123 for answering questions
+ Psi-Hate for testing
+ Shadowtrance for answering questions and testing
+ icecream for testing
+ s_99 for emotional support
+ dark_samus for testing
+ Urbanshadow for fixing my python script
+ Mrrraou for helping with support
+ felipejfc for compiling the Mac version of 3DSFAT16tool for me
+ dukesrg for hosting 2xrsa
+ all of #Cakey on Freenode for being awesome

*If I forgot you here, contact me and I'll add your name.*
