#!/bin/bash

# 1. Load .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# 2. Environment Variables for Development
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox' # or your preferred browser

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"
# Add asdf to PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# 3. Wayland & Graphics Fixes (Essential for Sway)
# -----------------------------------------------
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway

# Fix for Java apps (like IntelliJ/Android Studio) on Wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Ensure GTK apps use Wayland and the Dark/Black theme
export MOZ_ENABLE_WAYLAND=1  # Firefox Wayland support
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland,x11
export QT_QPA_PLATFORMTHEME=qt6ct

# 4. Auto-Start Sway on TTY1
# -----------------------------------------------
# If we are on the first virtual terminal and not inside a session yet:
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
