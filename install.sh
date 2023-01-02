#!/bin/bash

mkdir -p "$HOME/.config/nvim/lua/user"
ln -s "$(pwd)/init.lua" "$HOME/.config/nvim/lua/user/init.lua"
