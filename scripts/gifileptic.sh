#!/bin/bash
SCREEN=$(xrandr | grep ' connected' | cut -d' ' -f1);

# === VARIABLES === #
NO_INPUT=0
FORCE=0

# === FUNCTIONS === #
function forceWorkspace {
    i3-msg 'workspace 42';
}

function showImage {
    if ! pgrep -x "firefox" > /dev/null
    then
        firefox --new-window https://raw.githubusercontent.com/MarcVillain/Confloose/master/webpages/Lock.html 2>&1>/dev/null & disown
    fi
}

function fullScreenFirefox {
    i3-msg '[title=".*Mozilla Firefox"] fullscreen enable; [title=".*Mozilla Firefox"] move workspace 42' 2>&1>/dev/null
}

function randomGamma {
    randR=$(($RANDOM%2))
    randG=$(($RANDOM%2))
    randB=$(($RANDOM%2))

    xrandr --output $SCREEN --gamma $randR:$randG:$randB 2>&1>/dev/null
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

# === MAIN === #
function main {
    if [ $NO_INPUT == 1 ]
    then
        preventMouse;
        preventKeyboard;
    fi

    while true; do
        forceWorkspace;
        showImage;
        randomGamma;
        fullScreenFirefox;
    done
}

# === OPTIONS === #
if [ $# == 0 ]
then
    echo "Press Ctrl+C to exit." & main 2>&1>/dev/null
else
    for opt in "$@"
    do
        if [ opt = "-i" ]
        then
            NO_INPUT=1;
        elif [ opt = "-f" ]
        then
            FORCE=1;
        fi
    done

    if [ $FORCE == 1 ]
    then
        main 2>&1>/dev/null & disown
    else
        main 2>&1>/dev/null
    fi
fi
