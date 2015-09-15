# -*- coding: utf-8 -*-
"""
A Prettier Battery Module

This module uses FontAwesome to present a more visually intuitive version of the battery level.

Configuration parameters:
    - cache_timeout : how often we refresh this module in seconds

@author Jonas Wechsler jonaswechsler@gmail.com
@license BSD
"""

from time import time
import subprocess

class Py3status:
    # available configuration parameters
    cache_timeout = 10
    
    def battery(self, i3s_output_list, i3s_config):
        command = "cat /sys/class/power_supply/BAT0/capacity"
        process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
        charge = int(process.communicate()[0].strip())
        command = "cat /sys/class/power_supply/BAT0/status"
        process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
        charging = process.communicate()[0].strip()

        icon = ''
        if charge > 90:
            icon = ''
        elif charge > 70:
            icon = ''
        elif charge > 45:
            icon = ''
        elif charge > 20:
            icon = ''
        else:
            icon = ''
        if charging == 'Charging':
            icon = ''

        display = icon + ' ' + str(charge) + '%'
        response = {
            'cached_until': time() + self.cache_timeout,
            'full_text': display
        }
        return response

if __name__ == "__main__":
    """
    Test this module by calling it directly.
    This SHOULD work before contributing your module please.
    """
    from time import sleep
    x = Py3status()
    config = {
        'color_bad': '#FF0000',
        'color_degraded': '#FFFF00',
        'color_good': '#00FF00'
    }
    while True:
        print(x.battery([], config))
        sleep(1)
