#!/bin/bash
perl $HOME/.i3/scripts/i3subscribe.pl window workspace | node $HOME/.i3/scripts/lemonbar.js | $HOME/.i3/bar/lemonbar -g "x20" | bash | echo > $HOME/.i3/scripts/lemonbarlog

