#!/bin/bash

options=" Shutdown\n Reboot\n Logout\n Lock"
selected=$(echo -e "$options" | rofi -dmenu -i -p "Powermenu" -font "Fira Code Nerd Font 10" -lines 4 -width 20 -padding 20)
case "$selected" in
        " Shutdown")
                pkexec /sbin/poweroff now
                ;;
        " Reboot")
                pkexec /sbin/reboot
                ;;
        " Logout")
                pkill dwm
                ;;
        " Lock")
                betterlockscreen -u /home/scorpion/pictures/wallpapers/irl/forest-3.jpg -l
                ;;
        *)
                return
                ;;
esac
