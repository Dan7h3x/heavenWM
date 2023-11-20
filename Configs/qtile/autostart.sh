#!/usr/bin/env bash
#

picom &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --bg-scale -z ~/.config/Wallpaper/ &
ksuperkey -e "Super_L=Alt_L|F1" &
setxkbmap us,ir -option 'grp:alt_shift_toggle'
xfce4-power-manager &
mpd &
