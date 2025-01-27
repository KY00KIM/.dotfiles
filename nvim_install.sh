#!/bin/bash

# Detect the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Detected Linux"
    PKG_MANAGER="apt"
    INSTALL_CMD="sudo apt install -y"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"
    PKG_MANAGER="brew"
    INSTALL_CMD="brew install"
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

# 1. Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
if [[ "$PKG_MANAGER" == "apt" ]]; then
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar -xf lazygit.tar.gz -C /usr/local/bin
    echo "lazygit installed successfully"
elif [[ "$PKG_MANAGER" == "brew" ]]; then
    brew install lazygit
fi

# 2. Install fzf
$INSTALL_CMD fzf

# 3. Install fd-find
if [[ "$PKG_MANAGER" == "apt" ]]; then
    $INSTALL_CMD fd-find
elif [[ "$PKG_MANAGER" == "brew" ]]; then
    brew install fd
fi

# 4. Install ripgrep
$INSTALL_CMD ripgrep

# 5. Install Neovim
if [[ "$PKG_MANAGER" == "apt" ]]; then
    echo "Installing Neovim on Linux..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
    echo "Neovim installed successfully"
elif [[ "$PKG_MANAGER" == "brew" ]]; then
    echo "Installing Neovim on macOS..."
    brew install neovim
    echo "Neovim installed successfully"
fi

echo "All tools installed successfully"
