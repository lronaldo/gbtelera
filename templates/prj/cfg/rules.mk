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
### GBTelera Assembling, Linking and Fixing Rules
############################################################
### This makefile includes the definitions of the make
### rules required to assemble .asm files into .o objects,
### producing everyting into de $(OBJ) folder, linking 
### .o files into a .gb file and then fixing it, calculating
### and overwritting CRCs. This should produce a valid .gb
### file to be used within emulators or real hardware.
############################################################
### This file is not meant to work by itself. It should be
### included into another one where the macros should have
### been previously defined.
############################################################

###---------------------------------------------------------
### Linking and Fixing Rule: Producing the final $(TARGET) file
$(TARGET): $(OBJ_FILES)
	@echo "## LINKING: \"$(call AddCommas,$^)\" -> '$@'"
	$(RGBLINK) $^ -p $(PAD) -m $(OBJ)/$(MAP_FILE) -n $(OBJ)/$(SYM_FILE) -o $@
	@echo "## FIXING ROM: '$@'"
	$(RGBFIX) -p $(PAD) $(FIXFLAGS) $@

###---------------------------------------------------------
### Generate Assembly Rule
###	$1: Object file to assemble
###
###	Functional Macro that generates a Rule to assemble a
### given object file. It makes it depend on a similar
### source file that should be under the same path but in
### the source folder.
###
define GenerateAssemblyRule
$(eval __OBJECT:=$(strip $(1)))
$(eval __SOURCE:=$(call Swap,$(OBJ),$(OBJ_EXT),$(SRC),$(SRC_EXT),$(__OBJECT)))
$(__OBJECT): $(__SOURCE)
	@echo "## ASSEMBLING: '$(__SOURCE)' -> '$(__OBJECT)'"
	$(MKDIR) -p ./$(dir $(__OBJECT))
	$(RGBASM) $(__SOURCE) -p $(PAD) $(ASMFLAGS) $(INCLUDE) $(GBT_INCLUDE) -o $(__OBJECT)
endef

###---------------------------------------------------------
### Generate and evaluate one assembly rule for each 
### object file to be produced
###
$(foreach FILE,$(OBJ_FILES),$(eval $(call GenerateAssemblyRule,$(FILE))))

###---------------------------------------------------------
### Clean Rule: Removes the $(OBJ) folder for it to be
###             produced again on next making
.PHONY: clean
clean:
	@echo "%% CLEANING (Removing object folder)"
	$(RM) -rf ./$(OBJ)

###---------------------------------------------------------
### Cleanall Rule: Removes the $(OBJ) folder and also 
###                $(TARGET) and $(SAV_FILE)
.PHONY: cleanall
cleanall: clean
	@echo "%% CLEANING (Removing target files)"
	$(RM) -f ./$(TARGET)
	$(RM) -f ./$(SAV_FILE)