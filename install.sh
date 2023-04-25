#!/bin/sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
ln -s ./custom ~/.config/nvim/lua/custom

