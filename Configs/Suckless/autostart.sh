#!/bin/bash

#Notifications and statusbar
dunst &
mpd &
#~/.local/bin/barinfo &
killall dwmblocks
dwmblocks &
ksuperkey -e 'Super_L=Alt_L|F1' &
#Nice Ones
xsetroot -cursor_name left_ptr

#Apps
picom &
feh --bg-fill -z ~/.config/Wallpaper/Sonic.jpg &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
setxkbmap us,ir -option 'grp:alt_shift_toggle' &
