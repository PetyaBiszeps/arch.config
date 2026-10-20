link_path() {
  local src="$1"
  local dest="$2"

  if [[ ! -e "$src" ]]; then
    echo "Error: source does not exist: $src" >&2
    return 1
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    rm -rf -- "$dest"
  fi

  mkdir -p -- "$(dirname "$dest")"
  ln -s -- "$src" "$dest"

  echo "Linked: $dest -> $src"
}

link_config() {
  local name="$1"

  link_path \
    "$ROOT_DIR/home/.config/$name" \
    "$HOME/.config/$name"
}
