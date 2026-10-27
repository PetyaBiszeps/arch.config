#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

echo "==> Preparing user environment"
bash "$ROOT_DIR/scripts/user.sh"

echo "==> Installing AUR helper"
bash "$ROOT_DIR/scripts/yay.sh"

echo "==> Downloading dependencies"
bash "$ROOT_DIR/scripts/download.sh"

echo "==> Linking configurations"
bash "$ROOT_DIR/scripts/link.sh"

echo "==> Initialization complete"
echo "==> Reboot..."

sudo systemctl reboot
