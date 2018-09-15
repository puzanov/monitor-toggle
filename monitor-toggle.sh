#!/bin/bash

EXTERNAL_OUTPUT="HDMI-1"
INTERNAL_OUTPUT="eDP-1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="EXTERNAL"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
	xrandr --output $EXTERNAL_OUTPUT --off --output $INTERNAL_OUTPUT --auto
else 
	monitor_mode="EXTERNAL"
	xrandr --output $INTERNAL_OUTPUT --off
	xrandr --output $EXTERNAL_OUTPUT --auto
	xrandr --output $EXTERNAL_OUTPUT --mode 1920x1080 --scale 1.5x1.5
	xrandr --output $EXTERNAL_OUTPUT --mode 1920x1080 --scale 1.5x1.5 --panning 1920x1080
fi	

echo "${monitor_mode}" > /tmp/monitor_mode.dat
