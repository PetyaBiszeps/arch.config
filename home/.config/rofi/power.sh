#!/usr/bin/env bash

set -euo pipefail

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/themes/power.rasi"

lock=' Lock'
suspend='󰤄 Suspend'
logout='󰍃 Logout'
reboot=' Reboot'
shutdown=' Shutdown'

choice="$(
    printf '%s\n' "$lock" "$suspend" "$logout" "$reboot" "$shutdown" |
        rofi -dmenu \
            -theme "$theme" \
            -p "$(hostname)" \
            -mesg "$(uptime -p)"
)" || exit 0

confirm() {
    local answer

    answer="$(
        printf '%s\n' 'No' 'Yes' |
            rofi -dmenu \
                -theme "$theme" \
                -theme-str 'window { width: 340px; }' \
                -theme-str 'listview { columns: 2; }' \
                -p "Confirm" \
                -mesg "Are you sure?"
    )" || return 1

    [[ "$answer" == "Yes" ]]
}

if [[ "$choice" != "$lock" ]] && ! confirm; then
    exit 0
fi

case "$choice" in
    "$lock")     hyprlock ;;
    "$suspend")  systemctl suspend ;;
    "$logout")   hyprctl dispatch exit ;;
    "$reboot")   systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
esac
