#!/usr/bin/env sh

set -eu

ARCH_CONFIG_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
SRC_DIR="$ARCH_CONFIG_DIR/assets/wallpapers"
DEST_DIR="$HOME/Pictures/Wallpapers"

echo "==> Linking wallpapers"

if [ ! -d "$SRC_DIR" ]; then
  echo "Skip: wallpapers source does not exist: $SRC_DIR"
  exit 0
fi

if [ -L "$DEST_DIR" ]; then
  rm "$DEST_DIR"
elif [ -e "$DEST_DIR" ]; then
  echo "Error: destination already exists: $DEST_DIR" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST_DIR")"
ln -s "$SRC_DIR" "$DEST_DIR"

echo "Linked: $DEST_DIR -> $SRC_DIR"
