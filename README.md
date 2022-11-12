AutoHotKey Retroarch launcher script
Version 2.0
David Marti

====================================================================

This script is for launching Retroarch with a specific core and also
passing additional arguments for MAME/MESS systems such as the MESS 
short name and media type arguments.

This script can be called by gaming front ends such as Attract Mode,
EmulationStation, Launchbox, RetroBat, etc.

The compiled run_retroarch.exe file is to be placed within the Retroarch
folder itself.

If the passed MESS system name is "default", the script will execute Retroarch
using just the passed arguments for the Retroarch core and rom filename.

If the passed MESS system name is not "default" the script will dynamically 
create a MESS cmd file with additional MESS arguments for Retroarch to use.

Passing the MAME/MESS information no longer requires the usage of the HASH files.

====================================================================

Compile:

To compile the exe file you must have AutoHotKey installed.

Once it is installed, within Windows Explorer, simply right click on the
run_retroarch.ahk file and choose Compile from the pop-up menu.

This will create the run_retroarch.exe file.

====================================================================

Usage:

When launching run_retroarch.exe, four parameters are needed.

Retroarch core filename (without the .dll extension)
MAME/MESS short system name (use default if the system is not MESS based)
MAME/MESS media type (use default if the system is not MESS based)
ROM filename with full path

Sample usage for running an Atari 2600 game (non MESS based system)

run_retroarch.exe stella_libretro default default "PATH\TO\ROMS\adventure.zip"

Sample usage for running a Coleco Adam game using the MAME/MESS core

run_retroarch.exe mame_libretro adam flop1 "PATH\TO\ROMS\buckrog.zip"

====================================================================

Front-end examples:

Attract Mode

executable        $PROGDIR\..\Emulators\RetroArch\run_retroarch.exe
args              stella_libretro default default "[romfilename]"

executable        $PROGDIR\..\Emulators\RetroArch\run_retroarch.exe
args              mame_libretro adam flop1 "[romfilename]"



RetroBat/EmulationStation

<command>"%HOME%\..\emulators\retroarch\run_retroarch.exe" stella_libretro default default %ROM%</command>

<command>"%HOME%\..\emulators\retroarch\run_retroarch.exe" mame_libretro adam flop1 %ROM%</command>












