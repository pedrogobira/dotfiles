#!/bin/bash

# Exit on error
set -e

echo "--- Starting Installation ---"
echo "Note: Built for Debian"

# 1. Update and install core system dependencies
sudo apt update && sudo apt upgrade -y
echo "Installing Window Manager, System Tools, and Laptop Support..."
sudo apt install -y sway swaybg swaylock swayidle waybar wofi alacritty \
    fonts-jetbrains-mono xdg-desktop-portal-wlr xwayland git stow \
    xdg-utils tlp tlp-rdw power-profiles-daemon

# 2. Install Applets and Hardware Management
echo "Installing applets and hardware tools..."
sudo apt install -y network-manager-gnome blueman pavucontrol \
    pipewire-audio wireplumber pulsemixer brightnessctl

# 3. Enable Laptop Power Savings & Services
sudo systemctl enable tlp
sudo tlp start
sudo systemctl enable --now power-profiles-daemon

# 4. Clone your Dotfiles
DOTFILES_DIR="$HOME/dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory already exists. Pulling latest changes..."
    cd "$DOTFILES_DIR" && git pull
else
    echo "Cloning dotfiles from GitHub..."
    git clone https://github.com/pedrogobira/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# 5. Use GNU Stow to symlink configs
echo "Stowing configurations..."

# Create .config directory if it doesn't exist to prevent stow from making a symlink of the folder itself
mkdir -p ~/.config

# Packages to stow (Ensure these exist in your repo)
STOW_PACKAGES=("sway" "waybar" "alacritty" "wofi" "bash")

for pkg in "${STOW_PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        echo "Linking $pkg..."
        stow -v -R "$pkg"
    else
        echo "Warning: Folder '$pkg' not found in dotfiles, skipping."
    fi
done

echo "--- Setup Complete! ---"
echo "Reboot or type 'sway' to start."
