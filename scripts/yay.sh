#!/usr/bin/env bash
set -euo pipefail

if command -v yay >/dev/null 2>&1; then
  echo "==> yay is already installed"
  exit 0
fi

if (( EUID == 0 )); then
  echo "Error: run yay.sh as a regular user, not root." >&2
  exit 1
fi

for bin in git makepkg; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Error: $bin is required to build yay." >&2
    exit 1
  fi
done

yay_dir="$HOME/Documents/dev/os/yay"
yay_url="https://aur.archlinux.org/yay.git"

if [[ -e "$yay_dir" ]]; then
  if [[ ! -d "$yay_dir" ]] ||
     [[ "$(git -C "$yay_dir" rev-parse --show-toplevel 2>/dev/null || true)" != "$yay_dir" ]] ||
     [[ "$(git -C "$yay_dir" remote get-url origin 2>/dev/null || true)" != "$yay_url" ]]; then
    echo "Error: $yay_dir is not the expected yay repository." >&2
    exit 1
  fi

  git -C "$yay_dir" pull --ff-only
else
  mkdir -p "$(dirname "$yay_dir")"
  git clone "$yay_url" "$yay_dir"
fi

(
  cd "$yay_dir"
  makepkg -si --noconfirm
)

echo "==> yay installed successfully"
