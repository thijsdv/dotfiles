#!/usr/bin/env sh

# This script will only work if vim, zsh and oh-my-zsh are installed

clear


# ---------------------------------------------------
# Install zsh if needed
# ---------------------------------------------------
if ! location="$(type -p "zsh")" || [ -z "$location" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# ---------------------------------------------------
# Powerlevel9k zsh theme
# ---------------------------------------------------
echo Installing Powerlevel9k zsh theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k &>/dev/null

# ---------------------------------------------------
# Awesome Fonts
# ---------------------------------------------------
echo Installing Awesome Font
git clone git@github.com:gabrielelana/awesome-terminal-fonts.git
cp awesome-terminal-fonts/build/* ~/.fonts/
sudo fc-cache -vf ~/.fonts/
ln -sf 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
rm -rf awesome-terminal-fonts

# ---------------------------------------------------
# Symlink zshrc
# ---------------------------------------------------
echo Creating zshrc symlink
ln -sf ~/dotfiles/zshrc ~/.zshrc

# ---------------------------------------------------
# Symlink vimrc and install plugins
# ---------------------------------------------------
ln -sf ~/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall

# ---------------------------------------------------
# Symlink i3 config
# ---------------------------------------------------
# ln -sf ~/dotfiles/i3/.config ~/.config/i3/config
