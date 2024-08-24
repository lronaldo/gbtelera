;;----------LICENSE NOTICE-------------------------------------------------------------------------------------------------------;;
;;  This file is part of GBTelera: A Gameboy Development Framework                                                               ;;
;;  Copyright (C) 2024 ronaldo / Cheesetea / ByteRealms (@FranGallegoBR)                                                         ;;
;;                                                                                                                               ;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    ;;
;; files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy,    ;;
;; modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the         ;;
;; Softwareis furnished to do so, subject to the following conditions:                                                           ;;
;;                                                                                                                               ;;
;; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.;;
;;                                                                                                                               ;;
;; THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          ;;
;; WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         ;;
;; COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   ;;
;; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         ;;
;;-------------------------------------------------------------------------------------------------------------------------------;;

;; You may include hardware.inc if you wanted to use its definitions
;; INCLUDE "hardware.inc"
;;    rev_Check_hardware_inc 4.0

;; See Pan Docs for reference ( https://gbdev.io/pandocs/The_Cartridge_Header.html )
SECTION "Header", ROM0[$100]
   ;;--------------------------------------
   ;;-- Entry Point ($0100-$0103. 4 bytes)
   nop     ;; [1 byte ] Do nothing, just take 1 byte of space to complete de 4 bytes
   ; di    ;; [1 byte ] Can also disable/enable interrupts instead (1 byte)
   jp main ;; [3 bytes] Jump to main (3 bytes)

   ;; Instead of manually creating the header, you can have RGBFIX 
   ;; handle it for you. You'll need to provide all the necessary information 
   ;; to RGBFIX via the command line. However, RGBFIX only __modifies__
   ;; existing bytes in the cartridge. Therefore, you'll need to include 
   ;; bytes here up to address $014F (with $0150 being the starting 
   ;; point of the game code).
   ;; This code only generates zeros up to $014F. If you use it,
   ;; make sure to remove the rest of the header and configure the RGBFIX 
   ;; command line parameters to fix the header after building the cartridge,
   ;; including all the necessary information for your game.
   ; ds $150 - @, 0

   ;;--------------------------------------
   ;;-- N1nt3nd0 L0g0 ($0104-$0133. 48 bytes)
   db $CE, $ED, $66, $66, $CC, $0D, $00, $0B, $03, $73, $00, $83, $00, $0C, $00, $0D
   db $00, $08, $11, $1F, $88, $89, $00, $0E, $DC, $CC, $6E, $E6, $DD, $DD, $D9, $99
   db $BB, $BB, $67, $63, $6E, $0E, $EC, $CC, $DD, $DC, $99, $9F, $BB, $B9, $33, $3E

   ;;--------------------------------------
   ;;-- Title ($0134-$013E. 11 bytes)
   ;;    If title is less than 11 bytes, 00's should be added as padding.
   ;;    Older cartridges used 16 bytes, and no manufacturer code was present
   ;;  0123456789A (Max 11 bytes, from 0 to A in Hex)
   db "Your Game"       ;; String constants do not end in 0
   ds $013F - @, 0      ;; Pad Title with 0's up to $013E

   ;;--------------------------------------
   ;;-- Manufacturer code ($013F-$0142, 4 bytes)
   ;;    The purpose is unknown
   db $EF, $AC, $AE, $AE   ;; UNIV{E}RSITY O{F} {A}LI{CA}NT{E} G{A}M{E}S

   ;;--------------------------------------
   ;;-- CGB Flag (Color GameBoy)
   ;;    $80 (CGB but Backwards compatible)
   ;;    $C0 (CGB Only)
   db $80   ;; Compatible

   ;;--------------------------------------
   ;;-- New licensee code ($0144-$0145, 2 bytes)
   ;;    Publisher code, but only for games after SGB (SuperGameBoy) release.
   ;;    For those games, a $33 code should be written in "Old licensee".
   ;;    Otherwise, old-licensee should be considered.
   db $00, $00 ;; No new licensee, see old licensee

   ;;--------------------------------------
   ;;-- SGB Flag ($0146, 1 byte)
   ;;    $03 (Super Gameboy Support)
   ;;    $00 (No-SGB Support)
   db $00   ;; No SGB

   ;;--------------------------------------
   ;;-- Cartridge Type ($0147, 1 byte)
   ;;    See https://gbdev.io/pandocs/The_Cartridge_Header.html#0147--cartridge-type for cartridge types
   db $03   ;; MBC1 + RAM + BATTERY, to use 32KB + 8KB external RAM + Battery for save games

   ;;--------------------------------------
   ;;-- ROM Size ($0148, 1 byte)
   ;;    Mostly 32 KiB * (1 << ROM Size). See https://gbdev.io/pandocs/The_Cartridge_Header.html#0148--rom-size
   db $00   ;; 32 KiB only 

   ;;--------------------------------------
   ;;-- RAM Size ($0149, 1 byte)
   ;;    See https://gbdev.io/pandocs/The_Cartridge_Header.html#0149--ram-size
   db $02   ;; 8 KiB (1 external Bank RAM)

   ;;--------------------------------------
   ;;-- Destination Code ($014A, 1 byte)
   ;;    $00 (Japan)
   ;;    $01 (Overseas only)
   db $01   ;; Overseas (no-Japan)

   ;;--------------------------------------
   ;;-- Old licensee code ($014B, 1 byte)
   ;;    Publisher (clasic cartridges used this byte)
   ;;    See https://gbdev.io/pandocs/The_Cartridge_Header.html#014b--old-licensee-code
   db $00   ;; No publisher

   ;;--------------------------------------
   ;;-- Mask ROM Version Number ($014C, 1 byte)
   ;;    Version number of this game
   db $00   ;; First version of the game

   ;;--------------------------------------
   ;;-- Header Checksum ($014D, 1 byte)
   ;;    rgbfix will calculate it
   db $EE   ;; Padding placeholder (Could be any byte. It will be overwritten)

   ;;--------------------------------------
   ;;-- Global Checksum ($014E-$014F, 2 bytes)
   ;;    rgbfix will calculate it
   db $DE, $AD ;; Padding placeholder (Could be any byte. It will be overwritten)
