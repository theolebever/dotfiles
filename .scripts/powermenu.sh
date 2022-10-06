#!/bin/bash

MESSAGE="What do you want to do "${USER^}"?"
POWER=""
RESTART="敏"
LOGOUT=""
LOCK=""
RES=`echo "$POWER|$RESTART|$LOGOUT|$LOCK" | rofi -font "SauceCodePro Nerd Font 11" -dmenu -p "$MESSAGE" -sep "|" -theme powermenu -monitor -1`
[ "$RES" = "$POWER" ] && systemctl poweroff
[ "$RES" = "$RESTART" ] && systemctl reboot
[ "$RES" = "$LOGOUT" ] && i3-msg exit
[ "$RES" = "$LOCK" ] && sleep .2 && betterlockscreen -l dimblur
