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

include cfg/gbtelera.mk       # GBTelera general configuration for the project
include cfg/projectpaths.mk   # Local paths and files for the project

##-----------------------------------------
## Project general configuration
PRJNAME  :=game
PAD      :=0xFF
INCLUDE  :=-Isrc
ASMFLAGS :=-E -Weverything
FIXFLAGS :=-v
TARGET   :=$(PRJNAME).gb
SAV_FILE :=$(PRJNAME).sav
MAP_FILE :=$(PRJNAME).map 
SYM_FILE :=$(PRJNAME).sym

# Asembling and linking rules
include cfg/rules.mk