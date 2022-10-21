#!/bin/bash

SPOTIFY=""
TERMINAL=""
CODE="﬏"
DISCORD="碌"
FERDI=""
THUNAR=""
CHROMIUM=""

RES=`echo "$SPOTIFY|$TERMINAL|$CODE|$DISCORD|$THUNAR|$CHROMIUM|$FERDI" | rofi -dmenu -sep "|" -theme dock -monitor -1`

[[ $RES == $SPOTIFY ]] && spotify 
[[ $RES == $TERMINAL ]] && alacritty
[[ $RES == $CODE ]] && code
[[ $RES == $DISCORD ]] && discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy
[[ $RES == $THUNAR ]] && thunar
[[ $RES == $CHROMIUM]] && chromium
[[ $RES == $FERDI ]] && ferdi
