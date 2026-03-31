#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TPM_DIR="$HOME/.tmux/plugins/tpm"

backup="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup"

move_if_exists() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    mv "$1" "$backup/"
  fi
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

if [ ! -d "$TPM_DIR" ]; then
  mkdir -p "$(dirname "$TPM_DIR")"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "✔ Dotfiles installed"
echo "📦 Backup en: $backup"
echo "✔ TPM installed in: $TPM_DIR"
