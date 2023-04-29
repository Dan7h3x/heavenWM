#!/bin/bash

#Notifications and statusbar
dunst &
mpd &
#~/.local/bin/barinfo &
killall dwmblocks
dwmblocks &
ksuperkey -e 'Super_L=Alt_L|F1' &
#Nice Ones
eww daemon &
xsetroot -cursor_name left_ptr
xfce4-power-manager &

#Apps
picom --experimental-backends --config ~/.config/bspwm/picom.conf &
feh --bg-fill -z ~/Pictures/Wallpaper/ &
xsetroot -cursor_name left_ptr &
numlockx on &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

while type dwm >/dev/null; do dwm && continue || break; done
