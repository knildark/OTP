# OTP Guide - New 3DS (Without Cubic Ninja)

This is a sub section of the main guide [here](https://github.com/Plailect/OTP/blob/master/README.md). Please read that first before continuing here.

**THIS IS COMPLETELY UNTESTED - THE ONLY AVAILABLE REGION ATM IS US**

## What You Need

* The 2.1 firmware pack for your region: ([U](https://mega.nz/#!IgUy1aJR!bDaYIBWLH6QePjh-buP0_SmXEwxZC0gEkKu4cbtxtNE) - [E]() - [J]()) (Mirrors: [U](https://drive.google.com/file/d/0BzPfvjeuhqoDQzdaWWtDclZmaHM/view?usp=sharing) - [E]() - [J]())
* A Hex Editor: ([HxD](https://mh-nexus.de/en/downloads.php)) or ([Bless](http://home.gna.org/bless/downloads.html))
* 3DSFAT16tool v2: ([Windows](https://mega.nz/#!d8dCALiT!BlGQJk0WgoiTZ_ydbI3HUeEe8b-pWq0WbuSRLBS6zKE) - [Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDUGp0em1RMUhBLWs/view?usp=sharing)) or ([Linux/Mac](https://mega.nz/#!898nHS6I!Wg2XLvKNYKngXen0o_nyuKfZ3K_tWl5og6zUSmSK2Zk) - [Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDYWNpX0dYblhPTkk/view?usp=sharing))
* [Decrypt9WIP](https://github.com/d0k3rypt9WIP/releases) ([Mirror](https://mega.nz/#!MgdQWYpK!CbB-EY2mPtpzHFL9Rj6GNTOpIorw6QQKdWjaL9T1H7Q)) ([Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDazFkbG5xMTV0d1U/view?usp=sharing))
* [EmuNAND9](https://github.com/d0k3/EmuNAND9/releases) ([Mirror](https://mega.nz/#!Yg8iDQqQ!ZMO3o1HETyIroTWX6xZ3wDT03dyyOus1CC32KHY69iQ)) ([Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDTGsxX3hDNFI0QU0/view?usp=sharing))
* [`arm11.bin`](https://mega.nz/#!ckcXxR4C!ISv4heZKgiIO1ZmAuk8AAxecET6SbXpW7z4PePiUlwY) ([Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDZGdKVEJUT1c0TXc/view?usp=sharing))
* [sysUpdater](https://github.com/profi200/sysUpdater/releases) ([Mirror](https://mega.nz/#!NkcEFaAD!x8mnHtm3xOrQ1fuXawGa2pipyWju6xdgaB04IyMcW3s)) ([Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDaHUxbExoZ1dRclU/view?usp=sharing))
* [TinyFormat](https://github.com/javimadgit/TinyFormat/releases) ([Mirror](https://mega.nz/#!cssQyQZI!84YufkNZ-3ZrhWHNVT8GxtWiDF61zgNqPyCeFBiXGJA)) ([Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDTkhqOXdOZS1qdDg/view?usp=sharing))
* [The NCSD Header from an Old 3DS](https://mega.nz/#!8sdTiSSZ!BRY6MCCSsYV3gml3r2yKZIzeWgIW7-g_R5rrqqEFxyA) ([Mirror](https://drive.google.com/file/d/0BzPfvjeuhqoDT2dEeGJxZEFHZkk/view?usp=sharing))
* [Launcher.dat QR Code](https://chart.googleapis.com/chart?cht=qr&chs=220x220&chl=http://dukesrg.no-ip.org/3ds/rop?GW147%20Safari/5373.dat%26Launcher.dat) ([Mirror](http://imgur.com/eIY7eEY)) ([Mirror](https://mega.nz/#!VgkDBIha!szD3vVQ1dwTAxx9cRG8AJYCrsLSg9IFKmsasPxHgy0E))
* Any game cart that contains an update version between 4.0 and 9.2 (See [3dsdb](http://www.3dsdb.com/) for which carts contain what updates)
* This guide assumes you are familiar with 3DS homebrew.
* This guide assumes you are on sysNAND version 9.2
* This guide assumes you have a working emuNAND and CFW (such as [CakesFW](https://github.com/mid-kid/CakesForeveryWan), [ReiNand](https://github.com/Reisyukaku/ReiNand), or [rxTools](https://github.com/roxas75/rxTools)).

## Instructions
### Section I - Prep Work
1. Download a copy of each of the things you need above and put them in a folder. The mirrors are alternate links in case the first ones do not work properly.
2. Copy Decrypt9, EmuNAND9, sysUpdater, and TinyFormat to the `/3ds/` folder of your SD card like any other homebrew application.
3. Extract the 2.1 firmware pack for your region and place the `updates` folder on the root of your SD card.
4. Copy `load.bin` and `code.bin` to the root of your SD card.
5. From sysNAND, get into the Homebrew Launcher through the entrypoint of your choice.
6. Open Decrypt9.
7. Following the options on the main menu, backup your sysNAND and your emuNAND to `sysNAND.bin` and `emuNAND.bin` respectively.
8. From Decrypt9's main menu, select "XORpad Generator Options."
9. Follow the options to dump "CTRNAND Padgen" to `nand.fat16.xorpad` (you cannot change the file name)
10. Press (Select) on the main menu to eject your SD card
11. Put your SD card in your computer, then copy over `sysNAND.bin`, `emuNAND.bin`, and `nand.fat16.xorpad` from `/Decrypt9/` to a safe location *that isn't the folder everything else for this is in* on your computer.
12. Rename `nand.fat16.xorpad` to `nand.fat16_0x5_.xorpad` on your computer.
13. Delete `sysNAND.bin`, `emuNAND.bin`, and `nand.fat16.xorpad` from `/Decrypt9/` on your SD card, then reinsert into your 3DS.
14. Press (B) then go to "XORpad Generator Options" once more. Follow the options to dump "CTRNAND Padgen 0x4" to `nand.fat16.xorpad` (you cannot change the file name)
15. Press (Select) on the main menu to eject your SD card, then copy over `nand.fat16.xorpad` from `/Decrypt9/` on your SD card.
16. Rename `nand.fat16.xorpad` to `nand.fat16_0x4_.xorpad` on your computer.
17. Delete `nand.fat16.xorpad` from `/Decrypt9/` on your SD card.
18. Copy **ALL** files from your SD card into a folder on your computer. The next step **will erase your SD card completely**.
19. Reinsert your SD into your 3DS, then press (Start) to reboot into sysNAND.
20. From sysNAND, get into the Homebrew Launcher through the entrypoint of your choice.
21. Open EmuNAND9.
22. Follow the options to "Complete EmuNAND Setup.
23. Copy your SD backup back to your SD card from your computer. (You do not have to copy `sysNAND.bin`, `emuNAND.bin`, `nand.fat16_0x4_.xorpad`, and `nand.fat16_0x5_.xorpad`)

### Section II - Downgrading
1. Boot your 3DS into emuNAND using the CFW of your choice.
2. Using the entrypoint of your choice, get into the Homebrew Launcher **in emuNAND**.
3. Open TinyFormat.
4. Press (Y) to format emuNAND.
5. Reboot into emuNAND and complete initial setup without linking NNID.
6. Using the entrypoint of your choice, get into the Homebrew Launcher **in emuNAND**.
7. Open sysUpdater.
8. Press (Y) to downgrade emuNAND to v2.1.
9. Reboot into sysNAND (emuNAND will be bricked by the downgrade) and get into the Homebrew Launcher through the entrypoint of your choice.
10. Open Decrypt9.
11. Following the options on the main menu, backup your emuNAND to `emuNAND.bin`.
12. Press (Select) on the main menu to eject your SD card, then copy over `emuNAND.bin` to your computer. **Do not overwrite your existing emuNAND backup.**
13. Move your bricked 2.1 `emuNAND.bin`, `nand.fat16_0x4_.xorpad`, and `nand.fat16_0x5_.xorpad` to the same folder as 3DSFAT16tool.
14. In a Command Prompt or Terminal window, `cd` into this folder.
15. Windows:
 + `3DSFAT16tool.exe -d -n emuNAND.bin ctr.bin nand.fat16_0x5_xorpad`
 + `3DSFAT16tool.exe -i -o emuNAND.bin ctr.bin nand.fat16_0x4_xorpad`
 + `mv emuNAND.bin sysNAND.bin`
 + `rem ctr.bin`

16. Mac/Linux:
 + `./3DSFAT16tool -d -n emuNAND.bin ctr.bin nand.fat16_0x5_xorpad`
 + `./3DSFAT16tool -i -o emuNAND.bin ctr.bin nand.fat16_0x4_xorpad`
 + `mv emuNAND.bin sysNAND.bin`
 + `rm ctr.bin`

17. Open both `NCSD_header_o3ds.bin` and the newly created `sysNAND.bin` in the hex editor of your choice.
18. Copy all of `NCSD_header_o3ds.bin`.
19. In `sysNAND.bin`, go to offset 0x200.
20. Select everything from offset 0x200 to the beginning of the file.
21. Paste to replace this selection with the contents of `NCSD_header_o3ds.bin`.
22. Save the file and exit. Copy the modified `sysNAND.bin` to `/Decrypt9/` on your SD card.
23. Reinsert your SD card into your 3DS and press (B).
24. Following the options on the main menu, restore your sysNAND from `sysNAND.bin`.
25. Cross your fingers.
26. Reboot.

### Section III - Getting the OTP
1. Copy `arm11.bin` to the root of your SD card.
2. Go to http://dukesrg.github.io/2xrsa.html?arm11.bin on your 3ds.
3. Wait for the flashes.
4. Check your `a9f.bin` on the SD card. If the exploit was successful then it should no longer be empty.
5. Remove your SD card and copy `a9f.bin` to your computer.
6. Backup `a9f.bin` somewhere safe.

### Section IV - Restoring the System
1. Copy Decrypt9's `Launcher.dat` to the root of your SD card.
2. Delete all files in `/Decrypt9/`.
3. Copy your original `sysNAND.bin` and `emuNAND.bin` backups to `/Decrypt9/`.
4. Reinsert your SD card into your 3DS.
5. Boot the 3DS back up.
6. Insert your game that contains an update to a version between 4.0 and 9.2
7. Disable all network connections on the 3DS and [delete any predownloaded updates](https://gbatemp.net/threads/381489/).
8. Launch the game.
9. When prompted, press (A) to update the console.
10. When the 3DS has rebooted launch `Launcher.dat` by either scanning the QR code linked above with the camera (L and R on the home menu) or manually going to http://dukesrg.no-ip.org/3ds/ and pressing launch.
11. Following the options on the main menu, restore your sysNAND and your emuNAND from `sysNAND.bin` and `emuNAND.bin` respectively.
12. Press (Select) to eject the SD card. On your computer, delete all files on the SD card and copy over your previous backup.
13. Reinsert the SD card and reboot!