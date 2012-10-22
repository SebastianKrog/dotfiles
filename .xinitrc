#!/bin/sh

# For configuring urxvt
xrdb -merge ~/.Xresources

# Set default cursor
xsetroot -cursor_name left_ptr

# Start automount of USB
udiskie &

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 0 --transparent true --alpha 0 --tint 0x000000 --height 16 &  

# Start xmobar
#xmobar &

# Start a terminal
#urxvt &

# Start xmonad
exec xmonad
