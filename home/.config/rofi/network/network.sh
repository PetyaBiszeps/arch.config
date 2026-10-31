#!/usr/bin/env bash

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/network/network.rasi"

choice="$(
  printf '%s\n' \
    '<span foreground="#2EC5E7">󰤨</span>  Home Wi-Fi  · Connected' \
    '󰤨  Office 5G' \
    '󰤥  Coffee Shop' \
    '󰤢  Guest Network' \
    '󰑐  Refresh networks' \
    '󰖪  Disable Wi-Fi' |
    rofi -dmenu -no-custom -markup-rows \
      -theme "$theme" -p "Wi-Fi"
)" || exit 0

printf 'Selected: %s\n' "$choice"
