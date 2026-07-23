#!/bin/bash

activeMonitors=$(xrandr --listactivemonitors | tail -n +2 | awk {'print $4'})

echo $activeMonitors
