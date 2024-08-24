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
### GBTelera Project Configuration file
############################################################
### Configures paths and executable tools and defines
### function macros that help in making executables
############################################################

##--------------------
## MAIN GBTelera folder configuration
GBT :=${GBT_PATH}

## Configure dependent paths only if GBT is set
ifneq ($(strip $(GBT)),)
   RGBDS       :=$(GBT)/tools/rgbds/
   GBT_INCLUDE :=-I$(GBT)/include
else
   $(warning "[[ WARNING ]]: GBT_PATH environment variable is not set. Using default system settings for RGBDS.")
endif

##--------------------
## Path configuration of GBTelera tools

## RGBDS tools' paths
RGBASM  :=@$(RGBDS)rgbasm
RGBLINK :=@$(RGBDS)rgblink
RGBFIX  :=@$(RGBDS)rgbfix
RGBGFX  :=@$(RGBDS)rgbgfx
MKDIR   :=@mkdir
RM      :=@rm

## Some useful characters
null  :=
space := $(null) #
comma := ,

##--------------------------------------------------------------------------------------------
## Gets all readable files that match a given extension, recursively from a given folder
## $1: Folder
## $2: Extension
##
define GetAllFilesFrom
$(shell find "$(strip $(1))" -iname '*.$(strip $(2))' -type f -readable)
endef

##--------------------------------------------------------------------------------------------
## Swaps all extensions from a given list of files
## $1: extension-from
## $2: extension-to
## $3: file list
##
define SwapExtension
$(patsubst %.$(strip $(1)),%.$(strip $(2)),$(3))
endef

##--------------------------------------------------------------------------------------------
## Swaps the prefix from a given list of strings
## $1: prefix-from
## $2: prefix-to
## $3: file list
##
define SwapPrefix
$(patsubst $(strip $(1))%,$(strip $(2))%,$(3))
endef

##--------------------------------------------------------------------------------------------
## Swaps prefix and extension from a given list of files
## $1: prefix-from
## $2: extension-from
## $3: prefix-to
## $4: extension-to
## $5: file list
##
define Swap
$(call SwapPrefix,$(1),$(3),$(call SwapExtension,$(2),$(4),$(5)))
endef

##--------------------------------------------------------------------------------------------
## Add commas in between of words in a word-list
## $1: word-list
##
define AddCommas
$(subst $(space),$(comma)$(space),$(strip $(1)))
endef

##--------------------------------------------------------------------------------------------
## Makes assembling, linking and fixing verbose
## Note: Requires $eval
##
define Verbose
RGBASM :=$(patsubst @%,%,$(RGBASM))
RGBLINK:=$(patsubst @%,%,$(RGBLINK))
RGBFIX :=$(patsubst @%,%,$(RGBFIX))
RGBFX  :=$(patsubst @%,%,$(RGBFX))
MKDIR  :=$(patsubst @%,%,$(MKDIR))
RM     :=$(patsubst @%,%,$(RM))
endef

##--------------------------------------------------------------------------------------------
## Activate verbose mode on user request (definition of VERBOSE macro)
ifdef VERBOSE
   $(eval $(call Verbose))
endif
