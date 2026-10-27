#!/usr/bin/env bash
set -euo pipefail

xdg-user-dirs-update

key="$HOME/.ssh/id_ed25519"

if [[ ! -e "$key" && ! -e "$key.pub" ]]; then
  read -r -p "SSH email: " email
  [[ -n "$email" ]] || { echo "Email is required" >&2; exit 1; }

  install -d -m 700 "$HOME/.ssh"
  ssh-keygen -t ed25519 -C "$email" -f "$key" -N ""
fi

if [[ -f "$key.pub" ]]; then
  cat "$key.pub"
fi
