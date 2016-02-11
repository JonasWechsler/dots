#!/bin/bash

clock(){
    echo "$(date "+%a %d %b %l:%M %p")"
}

while :; do
	echo "%{c}%{B#FF212121} whatever %{B}%{c}"
	sleep 1m
done |

$HOME/.i3/bar/lemonbar -g "1920x20" | bash

