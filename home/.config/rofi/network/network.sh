#!/usr/bin/env bash

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/network/network.rasi"

choice="$(
  {
    printf 'Home Wi-Fi · Connected\0icon\x1fnetwork-wireless\n'
    printf 'Office 5G\0icon\x1fnetwork-wireless\n'
    printf 'Coffee Shop\0icon\x1fnetwork-wireless\n'
    printf 'Guest Network\0icon\x1fnetwork-wireless\n'
    printf 'Refresh networks\0icon\x1fview-refresh\n'
    printf 'Disable Wi-Fi\0icon\x1fnetwork-wireless-offline\n'
  } | rofi -dmenu -no-custom \
      -theme "$theme" -p "Wi-Fi"
)" || exit 0

printf 'Selected: %s\n' "$choice"
