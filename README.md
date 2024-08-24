# gbtelera
Basic framework for Gameboy development in assembly.

This repository contains a minimal set of tools for Gameboy development under Linux systems, inspired in CPCtelera. By now, these are the tools included:
 - **RBGDS**: assembler and linker.
 - **BGB**: GB emulator and debugger.
 - **EMULICIUS**: GB emulator and debugger.
 - **GBMB/GBTD**: GB Map Builder and Tile Designer.
 - **Custom Makefile system**: Makefiles ready to create your project structure, compile and generate ROMs.
 - **Custom Scripts**: for creating projects, launching emulators and downloading the DMG Boot ROM.

GBTelera is a preliminary version and it's currently under development. You will need some knowledge to use it properly, and problems may arise. If you find any problems or imagine useful features, please report them under as github issues.

# How to install
Clone the repository to a desired folder, then add this lines to your `.bashrc` file:
```
###GBTELERA_START
##

export GBT_PATH=/path/to/main/folder/of/gbtelera/
export PATH=${PATH}:${GBT_PATH}/tools/rgbds:${GBT_PATH}/tools/scripts

###GBTELERA_END
```
Remember to substitute `/path/to/main/folder/of/gbtelera/` with the actual path where you clonned gbtelera.

# Author
Francisco J. Gallego-Durán 
 - aka. ronaldo / Cheesetea/ByteRealms
 - aka. ProfesorRetroman

X: @FranGallegoBR
X: @ProfeRetroman
Youtube: @ProfesorRetroman

