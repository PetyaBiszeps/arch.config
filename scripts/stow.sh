#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"

sudo pacman -S --needed --noconfirm stow

if [[ -d "$ROOT_DIR/home" ]]; then
  stow --dir="$ROOT_DIR" --target="$HOME" --no-folding home
fi
