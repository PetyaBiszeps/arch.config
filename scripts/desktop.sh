#!/usr/bin/env bash

set -euo pipefail

echo "==> Installing desktop applications"

yay -S --needed --noconfirm \
  discord spotify-launcher telegram-desktop steam lact

echo "==> Done"
