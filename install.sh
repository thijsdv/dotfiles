#!/usr/bin/env sh

# This script will only work if vim, zsh and oh-my-zsh are installed

clear


# ---------------------------------------------------
# Install zsh if needed
# ---------------------------------------------------
if ! location="$(type -p "zsh")" || [ -z "$location" ]; then
    echo Installing zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# ---------------------------------------------------
# Powerlevel9k zsh theme
# ---------------------------------------------------
if ! location="$(find ~/.oh-my-zsh --name "powerlevel9k")" || [ -z "$location" ]; then
    echo Installing Powerlevel9k zsh theme
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k &>/dev/null
fi

# ---------------------------------------------------
# Awesome Fonts
# ---------------------------------------------------
if ! location="$(find ~/.fonts --name "*awesome*")" || [ -z "$location" ]; then
    echo Installing Awesome Font
    git clone git@github.com:gabrielelana/awesome-terminal-fonts.git
    cp awesome-terminal-fonts/build/* ~/.fonts/
    cp awesome-terminal-fonts/config/* ~/.fonts/
    sudo fc-cache -vf ~/.fonts/
    ln -sf ~/.fonts/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
    rm -rf awesome-terminal-fonts
fi

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
# Set zsh as default sh
# ---------------------------------------------------
chsh -s $(which zsh)
