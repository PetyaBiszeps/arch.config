#!/usr/bin/env bash

sudo -v

(
  while sleep 60; do
    sudo -n -v || break
  done
) >/dev/null 2>&1 &

SUDO_PID=$!
trap 'kill "$SUDO_PID" 2>/dev/null || true' EXIT
