AutoHotKey Retroarch launcher script
Version 5.0
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

Usage:

When launching run_retroarch.exe, four paramters are needed.

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


====================================================================

Different versions of the same core examples:

This method provides the ability to be able to use different versions of the same Retroarch cores.

For example, you could be wanting to use 3 different versions of the MAME core.

An example of why this would be beneficial is:

you use the current MAME core version of .251 for arcade roms
you use the MAME core version for 0.201 for a few MESS based systems
you use the MAME core version for 0.183 for a few other MESS based systems
You simply rename the older versions of the MAME core to something different and use this launch commands to tell Retroarch which one to use.

New core filenames would be:

mess_mame0201_libretro.dll

mess_mame183_libretro.dll

You're launch commands would be:

run_retroarch.exe mess_mame201_libretro adam flop1 "PATH\TO\ROMS\buckrog.zip"

or

run_retroarch.exe mess_mame183_libretro adam flop1 "PATH\TO\ROMS\buckrog.zip"

Retroarch doesn't have a problem with the core files being renamed (as long as there are no duplicates).









