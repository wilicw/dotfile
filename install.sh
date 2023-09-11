#!/usr/bin/env bash

# Tmux config
mkdir -p ~/.config/tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $(pwd)/tmux.conf ~/.config/tmux/tmux.conf

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -rf ~/.config/nvim/lua/custom
ln -s $(pwd)/custom ~/.config/nvim/lua/custom
nvim

