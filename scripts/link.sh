#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link() {
  local src="$DOTFILES_DIR/configs/$1"
  local dest="$HOME/$1"

  if [ ! -e "$src" ]; then
    echo "WARNING: $src does not exist, skipping"
    return
  fi

  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "WARNING: $dest exists and is not a symlink - backing up to $dest.bak"
    run mv "$dest" "$dest.bak"
  fi

  run ln -sf "$src" "$dest" && echo "Linked $dest"
}

echo "Creating symlinks..."

link ".zshrc"
link ".bashrc"

link ".gitconfig"

link ".config/ghostty"
link ".config/tmux"
link ".config/nvim"
