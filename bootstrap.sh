#!/usr/bin/env bash
set -euo pipefail

if (( EUID == 0 )); then
  echo "Error: Do not run bootstrap as root." >&2
  exit 1
fi

REPO_URL="https://github.com/PetyaBiszeps/arch.config.git"
INSTALL_DIR="$HOME/Documents/dev/os/arch.config"

if [[ -d "$INSTALL_DIR/.git" ]]; then
  echo "==> Updating arch.config"
  git -C "$INSTALL_DIR" pull --ff-only
elif [[ -e "$INSTALL_DIR" ]]; then
  echo "Error: $INSTALL_DIR already exists and is not a Git repository." >&2
  exit 1
else
  echo "==> Cloning arch.config"
  mkdir -p "$(dirname "$INSTALL_DIR")"
  git clone "$REPO_URL" "$INSTALL_DIR"
fi

echo "==> Starting installation"
exec bash "$INSTALL_DIR/init.sh" </dev/tty
