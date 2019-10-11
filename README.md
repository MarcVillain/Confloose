# Confloose
This git repository contains harmless conflooses created to work on linux tiling window manager _i3_ for users forgetting to lock their session.

## Rules
- Use cautiously and only if you know what you are doing.
- You (and only you) will be held responsible for any bad use.
- Ensure all work is properly saved before running any scripts.

## How to use
Open a terminal using `Meta+Enter` and type:
```
 bash <(curl -s https://raw.githubusercontent.com/MarcVillain/Confloose/master/confloose_min.sh | base64 -d)
```
The space before the command prevents it from being added to the history logs.

## How to add script
```
vim scripts/<script_name>
./build.sh
```
To run locally:
```
bash <(cat ./confloose_min.sh | base64 -d)
```

## Scripts
- `Gifileptic` - Prevent the session from being used and display an animated gif in full screen.
- `AliasMixer` - Mix aliases and change certain commands outputs
- `BigBrother` - Displays an ascii art of eyes in every new terminal
- `SayPlease` - Asks the user to say "please" to be able to run the next command
- `RandomEject` - Running a command will have a 10% chance to open the cd player

## Removal methods
- `Ctrl+c`
- Execute `killall -9 bash`
- `Meta+Shift+E`
- Run `cleanup.sh`
- Reboot
