# Confloose
This git repository contains harmless conflooses created to work on linux tiling window manager _i3_ for users forgetting to lock their session.

## Rules
- Use cautiously and only if you know what you are doing.
- You (and only you) will be held responsible for any bad use.
- Ensure all work is properly saved before running any scripts.

## How to use
Open a terminal using `Meta+Enter` and type:
```
bash <(curl -s https://raw.githubusercontent.com/MarcVillain/Confloose/master/run.sh)
```

## Scripts
- `Gifileptic` - Prevent the session from being used and display an animated gif in full screen.
	- `-i` : Disable all mouses and keyboards input
	- `-f` : Prevent use of Ctrl+c
- `AliasMixer` - Mixes aliases and change certain commands outputs
- `BigBrother` - Displays an ascii art of eyes in every new terminal
- `SayPlease` - Asks the user to say "please" before running any command
- `Eject` - Running a command will have a 10% chance to open the cd player

## Removal methods
- `Ctrl+c`
- Execute `killall -9 bash`
- `Meta+Shift+E`
- Reboot
