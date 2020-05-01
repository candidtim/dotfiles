#!/bin/bash

# Automatically enable or disable VGA and HDMI monitors when they are connected or disconnected

displays=$(xrandr)

vga_connected=$(echo $displays | grep -oh "VGA1 connected")
hdmi_connected=$(echo $displays | grep -oh "HDMI1 connected")

if [ -n "$hdmi_connected" ]; then
  xrandr --output HDMI1 --auto --right-of eDP1
elif [ -n "$vga_connected" ]; then
  xrandr --output VGA1 --auto --right-of eDP1
else
  xrandr --output HDMI1 --off --output VGA1 --off
fi
