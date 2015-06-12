#!/bin/bash

healthy='#859900'
low='#b58900'
discharge='#dc322f'

capacity=`cat /sys/class/power_supply/BAT1/capacity`
if (($capacity <= 25));
then
        capacityColour=$low
else
        capacityColour=$healthy
fi

status=`cat /sys/class/power_supply/BAT1/status`

if [[ "$status" = "Discharging" ]]
then
        statusColour=$discharge
        status="▼"
else
        statusColour=$healthy
        status="▲"
fi

echo "<span>$capacity%</span> <span>$status</span>"
