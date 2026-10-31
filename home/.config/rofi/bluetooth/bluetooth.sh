#!/usr/bin/env bash

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/bluetooth/bluetooth.rasi"

choice="$(
  printf '%s\n' \
    '<span foreground="#2EC5E7">󰋋</span>  Headphones · Connected' \
    '󰌌  Keyboard' \
    '󰓃  Speaker' \
    '󰂰  Scan devices' \
    '󰂲  Disable Bluetooth' |
    rofi -dmenu -no-custom -markup-rows \
      -theme "$theme" -p "Bluetooth"
)" || exit 0

printf 'Selected: %s\n' "$choice"
