#!/bin/bash

stow .

# Nix
# sh <(curl -L https://nixos.org/nix/install)

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"

[ ! -f "$HOME/.zshenv" ] && cp ./zsh/.zshenv.example "$HOME/.zshenv"