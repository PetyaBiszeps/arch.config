#!/usr/bin/env bash
set -euo pipefail

theme="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/power/power.rasi"

choice="$(
  {
    printf 'Lock\0icon\x1f<span foreground="#2EC5E7"></span>\n'
    printf 'Suspend\0icon\x1f<span foreground="#2EC5E7">󰤄</span>\n'
    printf 'Logout\0icon\x1f<span foreground="#2EC5E7">󰍃</span>\n'
    printf 'Reboot\0icon\x1f<span foreground="#2EC5E7"></span>\n'
    printf 'Shutdown\0icon\x1f<span foreground="#2EC5E7"></span>\n'
  } | rofi -dmenu -no-custom -format i -theme "$theme"
)" || exit 0

if [[ "$choice" != 0 ]]; then
  actions=(Lock Suspend Logout Reboot Shutdown)

  answer="$(
    printf 'Cancel\nConfirm %s\n' "${actions[choice]}" |
      rofi -dmenu -no-custom -format i -theme "$theme" \
        -theme-str 'listview { lines: 2; }'
  )" || exit 0

  [[ "$answer" == 1 ]] || exit 0
fi

case "$choice" in
  0) exec hyprlock ;;
  1) exec systemctl suspend ;;
  2)
    if command -v uwsm >/dev/null && uwsm check is-active >/dev/null 2>&1; then
      exec uwsm stop
    fi
    exec hyprctl dispatch 'hl.dsp.exit()'
    ;;
  3) exec systemctl reboot ;;
  4) exec systemctl poweroff ;;
esac
