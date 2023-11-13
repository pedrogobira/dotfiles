# dev-setup

Debian/Ubuntu was used as base system for this set up

1. Run the install script for the needed packages
2. Clone the asdf repository and set it up

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
". \"\$HOME/.asdf/completions/asdf.bash\"
. \"\$HOME/.asdf/completions/asdf.bash\"" > $HOME/.bashrc
```

3. Add the needed asdf plugins

```sh
asdf plugin add neovim
asdf install neovim 0.9.0
asdf global neovim 0.9.0
```

4. Clone the neovim repository and set it up

```sh
git clone https://github.com/pedrogobira/nvim.git
mv nvim ~/.config
```

5. Setting up tmux configuration and tmux package manager

```sh
cp -r tmux ~/.config/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

P.S.: after that, run tmux and execute "prefix + I" to install the needed plugins

