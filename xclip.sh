#!/bin/bash

# Function to install xclip
install_xclip() {
    echo "Installing xclip on $1..."
    case "$1" in
        "Ubuntu"|"Debian")
            sudo apt-get update -y
            sudo apt-get install -y xclip
            ;;
        "CentOS"|"RHEL"|"Rocky"|"AlmaLinux")
            sudo yum install -y epel-release
            sudo yum install -y xclip
            ;;
        "Fedora")
            sudo dnf install -y xclip
            ;;
        "Arch")
            sudo pacman -Syu --noconfirm xclip
            ;;
        "openSUSE")
            sudo zypper install -y xclip
            ;;
        "MacOS")
            echo "xclip is not supported on macOS. Use pbcopy instead."
            ;;
        *)
            echo "Unsupported OS: $1"
            ;;
    esac
}

# Detect the OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/os-release ]; then
        # Extract the ID from os-release
        OS=$(grep ^ID= /etc/os-release | cut -d= -f2 | tr -d '"')
    elif [ -f /etc/redhat-release ]; then
        OS="RHEL"
    elif [ -f /etc/lsb-release ]; then
        OS="Ubuntu"
    else
        OS="Unknown"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="MacOS"
else
    OS="Unknown"
fi

# Call the install function
install_xclip "$OS"

