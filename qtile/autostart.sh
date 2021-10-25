#!/bin/sh

# systray battery icon
cbatticon -u 5 &
nitrogen --restore &
picom --experimental-backends &
# systray volume
volumeicon &
