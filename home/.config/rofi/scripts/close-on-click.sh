#!/usr/bin/env bash
set -euo pipefail

pgrep -u "$UID" -x rofi >/dev/null || exit 0

cursor="$(hyprctl cursorpos -j)"
layers="$(hyprctl layers -j)"

region="$(jq -r --argjson cursor "$cursor" '
  [.. | objects
    | select(.namespace? == "rofi" or .namespace? == "waybar")
    | select(.x != null and .y != null and .w != null and .h != null)
  ] as $layers
  | if ([$layers[] | select(.namespace == "rofi")] | length) == 0 then
      "none"
    elif any($layers[];
      $cursor.x >= .x and $cursor.x < (.x + .w) and
      $cursor.y >= .y and $cursor.y < (.y + .h)
    ) then
      "inside"
    else
      "outside"
    end
' <<< "$layers")"

if [[ "$region" == "outside" ]]; then
  pkill -u "$UID" -x rofi
fi
