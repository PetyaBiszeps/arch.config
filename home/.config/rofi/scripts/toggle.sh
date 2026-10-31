#!/usr/bin/env bash
set -euo pipefail

mode="${1:?Missing menu name}"
dir="${XDG_CONFIG_HOME:-$HOME/.config}/rofi"

pid="$(pgrep -u "$UID" -x rofi | head -n 1 || true)"

if [[ -n "$pid" && -r "/proc/$pid/cmdline" ]]; then
  args="$(tr '\0' ' ' < "/proc/$pid/cmdline")"

  current=""
  case "$args" in
    *"-show drun"*) current=launcher ;;
    *"/power/power.rasi"*) current=power ;;
    *"/network/network.rasi"*) current=network ;;
    *"/bluetooth/bluetooth.rasi"*) current=bluetooth ;;
  esac

  if [[ -n "$current" ]]; then
    kill "$pid" 2>/dev/null || true
    [[ "$current" == "$mode" ]] && exit 0

    for _ in {1..10}; do
      kill -0 "$pid" 2>/dev/null || break
      sleep 0.02
    done
  fi
fi

case "$mode" in
  launcher) exec rofi -show drun ;;
  power) exec "$dir/power/power.sh" ;;
  network) exec "$dir/network/network.sh" ;;
  bluetooth) exec "$dir/bluetooth/bluetooth.sh" ;;
  *) echo "Unknown Rofi menu: $mode" >&2; exit 1 ;;
esac
