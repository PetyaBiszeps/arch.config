#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"

source "$ROOT_DIR/scripts/utils/symlink.sh"

link_config "hypr"
link_config "waybar"
