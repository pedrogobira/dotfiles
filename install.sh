#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or root"
  exit 1
fi

apt update
apt install curl git kitty tmux -y
