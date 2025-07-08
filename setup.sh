#!/usr/bin/env bash

echo "Setting up symlinks..."

ln -sf ~/dotfiles/.zshrc ~/.zshrc

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"
    ln -sf ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    if grep -qEi "(Microsoft|WSL)" /prox/version &> /dev/null ; then
    echo "Detected WSL"
    ln -sf ~/dotfiles/.zshrc ~/.zshrc
    fi

else
    echo "Unsupported OS: $OSTYPE"
fi