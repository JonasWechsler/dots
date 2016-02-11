#!/bin/bash
eval $(xdotool getmouselocation --shell)
$HOME/.i3/bin/dmenu_run -p \> -l 20 -x $X -y $Y -w 200
