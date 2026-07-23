#!/bin/sh
xrandr --output HDMI-0 --off --output DVI-I-5-4 --off --output DVI-I-4-3 --off --output DVI-I-3-2 --off --output DVI-I-2-1 --off --output eDP-1-1 --mode 1680x1050 --pos 3840x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off --output DP-1-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-1-3 --off

sleep 2

feh --bg-fill /home/luca/Pictures/wallpaper/background-4.png
