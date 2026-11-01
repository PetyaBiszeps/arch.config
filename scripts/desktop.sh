#!/usr/bin/env bash

set -euo pipefail

echo "==> Installing desktop applications"

yay -S --needed --noconfirm \
  discord telegram-desktop steam

echo "==> Done"
