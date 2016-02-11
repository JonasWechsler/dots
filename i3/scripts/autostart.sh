#!/bin/sh
i3 workspace 1 &
compton &
gsettings set org.gnome.desktop.background show-desktop-icons false &
xscreensaver &
nm-applet &

bash $HOME/.i3/scripts/screen.sh > $HOME/.i3/scripts/screenlog
bash $HOME/.i3/scripts/audio.sh > $HOME/.i3/scripts/audiolog
bash $HOME/.i3/scripts/lemonbar.sh > $HOME/.i3/scripts/lemonlog &
feh --bg-fill $HOME/Pictures/mountains.png
