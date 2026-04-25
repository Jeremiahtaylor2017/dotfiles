#!/usr/bin/env bash

echo "Setting up symlinks..."

ln -sf ~/dotfiles/.zshrc ~/.zshrc

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"
    ln -sf ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
    ln -sf ~/dotfiles/oh-my-zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    if grep -qEi "(Microsoft|WSL)" /prox/version &> /dev/null ; then
    echo "Detected WSL"
    ln -sf ~/dotfiles/.zshrc ~/.zshrc
    ln -sf ~/dotfiles/oh-my-zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
    fi

else
    echo "Unsupported OS: $OSTYPE"
fi

echo "Symlinks complete"

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

# tmux
echo "Setting up tmux..."

ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.tmux/plugins

if ! command -v tmux >/dev/null 2>&1; then
	echo "tmux is not installed. Install it first, then re-run this script."
else
	echo "tmux found: $(tmux -V)"
fi

# TPM
if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Catppuccin is referenced directly in .tmux.conf, so install it manually
if [ ! -d ~/.tmux/plugins/catppuccin/tmux ]; then
	git clone https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppucin/tmux
fi

echo "tmux config linked."
echo "TMP and Catppuccin are installed if they were missing."
echo "Open tmux and press prefix + I to install/update TPM-managed plugins."
