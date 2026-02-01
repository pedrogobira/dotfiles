#!/bin/bash

# =============================================================================
# NAVIGATION
# =============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias dots='cd ~/dotfiles'
alias dl='cd ~/Downloads'
alias dev='cd ~/dev' # or wherever you keep your code

# =============================================================================
# DEVELOPMENT TOOLS
# =============================================================================
alias nvim='nvim-linux-x86_64.appimage'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias g='git'
alias gs='git status'
alias gp='git push'
alias gl='git log --oneline --graph --all'

# =============================================================================
# SYSTEM MANAGEMENT (Debian 13)
# =============================================================================
alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias search='apt search'
alias list='apt list --installed'

# =============================================================================
# LISTING & UTILS
# =============================================================================
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

# Quick reload of shell
alias reload='source ~/.bashrc'

# Safety prompts
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# System info
alias myip='curl ifconfig.me'
alias df='df -h'
alias free='free -m'
