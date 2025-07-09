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

echo "Installing custom oh-my-zsh plugins"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# powerlevel10k
if [ ! -d "ZSH_CUSTOM/plugins/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

echo "✅ Plugins installed!"
