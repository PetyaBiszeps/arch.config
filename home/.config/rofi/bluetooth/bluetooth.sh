#!/usr/bin/env bash

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/bluetooth/bluetooth.rasi"

choice="$(
  {
    printf 'Headphones · Connected\0icon\x1faudio-headphones\n'
    printf 'Keyboard\0icon\x1finput-keyboard\n'
    printf 'Speaker\0icon\x1faudio-speakers\n'
    printf 'Scan devices\0icon\x1fview-refresh\n'
    printf 'Disable Bluetooth\0icon\x1fbluetooth-disabled\n'
  } | rofi -dmenu -no-custom \
      -theme "$theme" -p "Bluetooth"
)" || exit 0

printf 'Selected: %s\n' "$choice"
