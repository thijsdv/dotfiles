#!/usr/bin/env sh

# This script will symlink all the config files

clear

# ---------------------------------------------------
# Symlink zshrc
# ---------------------------------------------------
echo Creating zshrc symlink
ln -sf ~/dotfiles/zshrc ~/.zshrc

# ---------------------------------------------------
# Symlink vimrc and install plugins
# ---------------------------------------------------
if ! location="$(find ~/.vim --name "vundle")" || [ -z "$location" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
ln -sf ~/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall

# ---------------------------------------------------
# Symlink i3 config
# ---------------------------------------------------
ln -sf ~/dotfiles/i3config ~/.config/i3/config

# ---------------------------------------------------
# Symlink xonsh config
# ---------------------------------------------------
ln -sf ~/dotfiles/xonsh_config.json ~/.config/xonsh/config.json
