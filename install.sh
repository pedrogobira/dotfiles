#!/bin/bash

# Exit on error
set -e

echo "--- Starting Installation ---"
echo "Note: Built for Debian"

# 1. Update and install core system dependencies
sudo apt update && sudo apt upgrade -y
echo "Installing Window Manager and System Tools..."
sudo apt install -y sway swaybg swaylock swayidle waybar wofi alacritty \
    fonts-jetbrains-mono xdg-desktop-portal-wlr xwayland git stow

# 2. Install Applets and Hardware Management
echo "Installing applets and hardware tools..."
sudo apt install -y network-manager-gnome blueman pavucontrol \
    pipewire-audio wireplumber pulsemixer brightnessctl

# 3. Clone your Dotfiles
DOTFILES_DIR="$HOME/dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory already exists. Pulling latest changes..."
    cd "$DOTFILES_DIR" && git pull
else
    echo "Cloning dotfiles from GitHub..."
    git clone https://github.com/pedrogobira/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# 4. Use GNU Stow to symlink configs
# This assumes your repo has folders named 'sway', 'waybar', 'alacritty', etc.
echo "Stowing configurations..."

# Create .config directory if it doesn't exist to prevent stow from making a symlink of the folder itself
mkdir -p ~/.config

# List the packages you want to stow here
STOW_PACKAGES=("sway" "waybar" "alacritty" "wofi")

for pkg in "${STOW_PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        echo "Linking $pkg..."
        stow -v -R "$pkg"
    else
        echo "Warning: Folder '$pkg' not found in dotfiles, skipping."
    fi
done

echo "--- Setup Complete! ---"
echo "Note: Ensure your 'sway' folder in the repo contains the subpath '.config/sway/'"
echo "You can now start the environment by typing: sway"
