#!/bin/bash
SCREEN=$(xrandr | grep 'connected' | cur -d' ' -f1);

while true; do i3-msg 'workspace 1'; done 2>&1 >/dev/null &
disown
