#!/bin/sh
picom &
nm-applet &
xfce4-clipman &
redshift &
lxpolkit &
xss-lock --transfer-sleep-lock -- i3lock-fancy-rapid 20 5 &
setxkbmap -option "caps:escape" &
