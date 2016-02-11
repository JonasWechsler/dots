#!/bin/bash
scrot -e 'convert -resize 20% -fill "#282828" -colorize 50% -blur 0x1 -resize 500% $f /tmp/screenshotblur.png'
i3lock -i /tmp/screenshotblur.png
rm /tmp/screenshotblur.png
