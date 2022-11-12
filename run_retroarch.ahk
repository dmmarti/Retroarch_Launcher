; AutoHotKey Retroarch launcher script
; Version 2.0
; David Marti
;
; This script is for launching Retroarch with a specific core and also
; passing additional arguments for MAME/MESS systems such as the MESS 
; short name and media type arguments.
;
; This script can be called by gaming front ends such as Attract Mode,
; EmulationStation, Launchbox, RetroBat, etc.
;
; The compiled run_retroarch.exe file is to be placed within the RetroArch
; folder itself.
;
; If the passed MESS system name is "default", the script will execute RetroArch
; using just the passed arguments for the Retroarch core and rom filename.
;
; If the passed MESS system name is not "default" the script will dynamically 
; create a MESS cmd file with additional MESS arguments for RetroArch to use.
;
; Usage:
;
; When launching run_retroarch.exe, four paramters are needed.
;
; Retroarch core filename (without the .dll extension)
; MAME/MESS short system name (use default if the system is not MESS based)
; MAME/MESS media type (use default if the system is not MESS based)
; ROM filename with full path
;
; Sample usage for running an Atari 2600 game (non MESS based system)
;
; run_retroarch.exe stella_libretro default default "PATH\TO\ROMS\adventure.zip"

; Sample usage for running a Coleco Adam game using the MAME/MESS core
;
; run_retroarch.exe mame_libretro adam flop1 "PATH\TO\ROMS\buckrog.zip"

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileDelete, mess.cmd

; Get passed RetroArch core, system name, media type, and rom file
; %1% = RetroArch core
; %2% = MESS system name
; %3% = MESS media type
; %4% = rom filename with full path

; Get rom filepath
SplitPath, 4, name, dir

; If the passed MESS system name is default, execute RetroArch normally.
; Otherwise, create the special MESS cmd file and append it.

; For MAME/MESS based systems:
; Create dynamic mess.cmd file and launch RetroArch
; Most sytems work with the current MAME core others need older versions
; Some systems need additional MESS paramters to operate fully

if 2 = default 
{
  RunWait, retroarch.exe -L cores\%1%.dll "%4%"
}
else if 2 = aa310 
{
  FileAppend, %2% -rp ".\system" -bios 319 -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = apfimag
{
  FileAppend, %2% -cart basic -rp ".\system" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = apple2ee
{
  FileAppend, %2% -rp ".\system" -gameio joy -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = apple2gsr1
{
  FileAppend, %2% -rp ".\system" -gameio joy -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = cgenie
{
  FileAppend, %2% -rp ".\system" -ramsize 32k -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = cpc6128p
{
  FileAppend, %2% -rp ".\system" -cart "%dir%\ENGPADOS.CPR" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = ep128
{
  FileAppend, %2% -cart "%dir%\basic.zip" -exp exdos -rp ".\system" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = fmtmarty
{
  FileAppend, %2% -rp ".\system" -ram 4M -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = fmtowns
{
  FileAppend, %2% -rp ".\system" -ram 4M -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = gp32
{
  FileAppend, %2% -rp ".\system" -bios 166m -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = jupace
{
  FileAppend, %2% -rp ".\system" -ram 48k -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = laser210
{
  FileAppend, %2% -rp ".\system" -io joystick -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = mbc55x
{
  FileAppend, %2% -rp ".\system" -gameio joy -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = mc10
{
  FileAppend, %2% -rp ".\system" -ramsize 20k -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = pc6001mk2
{
  FileAppend, %2% -rp ".\system" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess_pc6001mk2.cfg mess.cmd
}
else if 2 = samcoupe
{
  FileAppend, %2% -rp ".\system" -autoboot_command \n"BOOT\n" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = sorcererbasic
{
  FileAppend, %2% -rp ".\system" -cart  "%dir%\basicpac.zip" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = ti99_4a
{
  FileAppend, %2% -rp ".\system" -ioport peb -ioport:peb:slot2 32kmem -ioport:peb:slot3 speech -nat -joy -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}
else if 2 = trs80m3
{
  if 3 = flop1
  {
    FileAppend, %2% -rp ".\system" -flop1 "%dir%\MULTIDOS.DSK" -flop2 "%4%", mess.cmd
    RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
  }
  else
  {
    FileAppend, %2% -rp ".\system" -%3% "%4%", mess.cmd
    RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
  }
}
else if 2 = tvc64
{
  if 3 = flop1
  {
    FileAppend, %2% -rp ".\system" -exp1 hbf -flop1 "%4%", mess.cmd
    RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
  }
  else
  {
    FileAppend, %2% -rp ".\system" -%3% "%4%", mess.cmd
    RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
  }
}
else
{
  FileAppend, %2% -rp ".\system" -%3% "%4%", mess.cmd
  RunWait, retroarch.exe -L cores\%1%.dll --appendconfig override_mess.cfg mess.cmd
}




