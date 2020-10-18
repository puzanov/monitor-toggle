#!/bin/bash

EXTERNAL_OUTPUT="HDMI-1"
INTERNAL_OUTPUT="eDP-1"

# scalings
# 1.5
# 1.76
# 1.333

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
	# 2560x1440     59.95 +
	#xrandr --output $EXTERNAL_OUTPUT --mode 1920x1200 --scale 1.5x1.5 --panning 2880x1800 #DELL 24 
	xrandr --output $EXTERNAL_OUTPUT --mode 2560x1440 --scale 1.5x1.5 --panning 3840x2160 #DELL 27 
	#xrandr --output $EXTERNAL_OUTPUT --mode 1920x1080 --scale 1.66x1.66 --dpi 272
	#xrandr --output $EXTERNAL_OUTPUT --mode 1920x1080 --scale 1.66x1.66 --dpi 272 --panning 1920x1080
fi	

echo "${monitor_mode}" > /tmp/monitor_mode.dat
