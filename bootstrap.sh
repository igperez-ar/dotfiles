#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

backup="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup"

move_if_exists() {
  [ -e "$1" ] && [ ! -L "$1" ] && mv "$1" "$backup/"
}

paths=(
  ".zshrc"
  ".tmux.conf"
  ".config/nvim"
  ".config/zsh"
  ".config/starship.toml"
)

for path in "${paths[@]}"; do
  move_if_exists "$HOME/$path"
done

cd "$DOTFILES"
stow zsh tmux nvim starship

echo "✔ Dotfiles installed"
echo "📦 Backup en: $backup"
