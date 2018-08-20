#!/bin/bash
SCREEN=$(xrandr | grep ' connected' | cut -d' ' -f1);

# Disable input using parameter 'disable'
DISABLE_INPUT=0
if ! [ -z '$1' ] && [[ $1 == 'disable' ]]
then
    DISABLE_INPUT=1
fi

function forceWorkspace {
    i3-msg 'workspace 42';
}

function showImage {
    if ! pgrep -x "firefox" > /dev/null
    then
        killall -9 firefox;
        sleep 0.2;
        firefox --new-window https://raw.githubusercontent.com/MarcVillain/Confloose/master/images/Lock.gif & disown
    fi
}

function fullScreenFirefox {
    i3-msg '[title=".*Mozilla Firefox"] fullscreen enable; [title=".*Mozilla Firefox"] move workspace 42';
}

function updateGamma {
    xrandr --output $SCREEN --gamma 1:0.001:0.001;
    sleep 0.1;
    xrandr --output $SCREEN --gamma 0.001:1:0.001;
    sleep 0.1;
    xrandr --output $SCREEN --gamma 0.001:0.001:1;
    sleep 0.1;
}

function preventMouse {
    while read -r line; do
        xinput disable $line;
    done < <(xinput | grep Mouse | tr -d ' ' | tr '\t' ' ' | cut -d' ' -f2 | cut -d'=' -f2)
}

function preventKeyboard {
    while read -r line; do
        xinput disable $line;
    done < <(xinput | grep Keyboard | tr -d ' ' | tr '\t' ' ' | cut -d' ' -f2 | cut -d'=' -f2)
}

function main {
    while true; do
        if [ DISABLE_INPUT = 1 ]
        then
            preventMouse;
            preventKeyboard;
        fi
        forceWorkspace;
        showImage;
        updateGamma;
        fullScreenFirefox;
    done
}

main 2>&1>/dev/null & disown
