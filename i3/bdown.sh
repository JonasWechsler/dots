xrandr --output LVDS-0 --brightness $(echo $(xrandr --verbose | awk '/Brightness/ {print $2; exit}')' - 0.1' | bc)
