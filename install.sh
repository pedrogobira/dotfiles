#!/bin/bash

# Check if the script is being run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# installing needed packages
apt update
apt install curl git kitty tmux -y
echo "Kitty and tmux have been installed successfully."

# asdf setup
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
if [ $? -eq 0 ]; then
  lines_to_append=". \"\$HOME/.asdf/completions/asdf.bash\"
  . \"\$HOME/.asdf/completions/asdf.bash\""

  # Check if the lines are already present in .bashrc to avoid duplication
  if grep -Fxq "$lines_to_append" "$HOME/.bashrc"; then
      echo "Lines are already present in .bashrc. No changes needed."
  else
      echo "$lines_to_append" >> "$HOME/.bashrc"
      echo "Lines appended to .bashrc successfully."
  fi
  echo "asdf has been installed successfully."
else
  echo "Failed to clone asdf repository. Exiting..."
  exit 1
fi

asdf plugin add neovim
asdf install neovim 0.9.0
asdf global neovim 0.9.0

echo "Neovim installation completed successfully."

# neovim setup
git clone https://github.com/pedrogobira/neovim.git
if [ -d "neovim" ]; then
  mv neovim ~/.config/nvim
  echo "The 'neovim' folder has been renamed to 'nvim' and copied to ~/.config."
else
  echo "Failed to clone the 'neovim' repository or the 'neovim' folder doesn't exist."
  exit 1
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
if [ $? -eq 0 ]; then
  echo "Packer.nvim has been installed successfully."
else
  echo "Failed to clone 'packer.nvim' repository. Exiting..."
  exit 1
fi

# tmux setup
cp -r tmux ~/.config/
echo "The 'tmux' folder has been copied to ~/.config."

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if [ $? -eq 0 ]; then
  echo "Tmux Package Manager (TPM) has been installed successfully."
else
  echo "Failed to clone 'tpm' repository. Exiting..."
  exit 1
fi

# fonts
mkdir -p ~/.local/share/fonts

cp -r fonts/* ~/.local/share/fonts/
echo "Fonts copied to ~/.local/share/fonts."

fc-cache -f

# kitty setup
cp -r kitty ~/.config/
echo "The 'kitty' folder has been copied to ~/.config."

# bash
if [ -f ~/.bash_aliases ]; then
  cp -f bash/.bash_aliases ~/
  echo "The '.bash_aliases' file has been copied to the home directory and replaced."
else
  # If .bash_aliases doesn't exist in ~, copy it directly
  cp bash/.bash_aliases ~/
  echo "The '.bash_aliases' file has been copied to the home directory."
fi


echo "Now run the kitty terminal emulator run nvim and then, in command mode, execute PackerInstall. After that run tmux and use the shortcut <prefix-I> to install the whatever plugins there are. Have fun"
