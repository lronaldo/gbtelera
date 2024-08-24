##----------LICENSE NOTICE-------------------------------------------------------------------------------------------------------##
##  This file is part of GBTelera: A Gameboy Development Framework                                                               ##
##  Copyright (C) 2024 ronaldo / Cheesetea / ByteRealms (@FranGallegoBR)                                                         ##
##                                                                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    ##
## files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy,    ##
## modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the         ##
## Softwareis furnished to do so, subject to the following conditions:                                                           ##
##                                                                                                                               ##
## The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.##
##                                                                                                                               ##
## THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          ##
## WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         ##
## COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   ##
## ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         ##
##-------------------------------------------------------------------------------------------------------------------------------##

############################################################
### GBTelera Project Local Paths and Files Configuration
############################################################
### Configures local paths, extensions and files that
### will be assembled and linked
############################################################

##--------------------
## Project folder structure
SRC :=src
OBJ :=obj
CFG :=cfg

##--------------------
## File Extensions
SRC_EXT:=asm
OBJ_EXT:=o

##--------------------
## All source files and object files
SRC_FILES:=$(call GetAllFilesFrom,$(SRC),$(SRC_EXT))
OBJ_FILES:=$(call Swap,$(SRC),$(SRC_EXT),$(OBJ),$(OBJ_EXT),$(SRC_FILES))