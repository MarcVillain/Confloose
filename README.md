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

## Removal methods
- `Ctrl+c`
- Execute `killall -9 bash`
- `Meta+Shift+E`
- Reboot