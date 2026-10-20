#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"

if [[ -f "$ROOT_DIR/.gitmodules" ]]; then
  git -C "$ROOT_DIR" submodule update --init --recursive
fi
