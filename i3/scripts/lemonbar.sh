#!/bin/bash
perl $HOME/.i3/scripts/i3subscribe.pl window workspace | nodejs $HOME/.i3/scripts/lemonbar.js | $HOME/.i3/bin/lemonbar -g "x20" | bash | echo > $HOME/.i3/scripts/lemonbarlog

