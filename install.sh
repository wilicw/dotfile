#!/usr/bin/env bash

# Tmux config
mkdir -p ~/.config/tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $(pwd)/tmux.conf ~/.config/tmux/tmux.conf

rm -rf ~/.config/nvim
ln -s $(pwd)/nvim ~/.config/nvim
nvim

