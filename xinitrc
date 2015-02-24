#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#terminator &
#exec bspwm

set +fp /usr/share/fonts/TTF
xset fp rehash
fc-cache -fv
xrdb -load ~/.Xresources
systemctl start NetworkManager
systemctl enable NetworkManager
exec i3
#urxvt &
#sxhkd &
#exec bspwm
