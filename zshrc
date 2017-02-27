# ----------------------------------------------------------------
# Exports
# ----------------------------------------------------------------
export TERM="xterm-256color"
export ZSH=/home/$USER/.oh-my-zsh
export skye=/home/$USER/Documents/renson/skye/skye
export vent=/home/$USER/Documents/renson/smart-fan/
export PATH=/usr/lib64/qt-3.3/bin:/home/thijs/gcc-arm-none-eabi-4_9-2014q4/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/thijs/.local/bin:/home/thijs/bin:/home/thijs/Documents/renson/ventilator/esp-open-sdk/xtensa-lx106-elf/bin

# New window or tab -> check if shorter path name can be displayed
if [ "$PWD/" = "$skye" ]; then
    cd ~skye
elif [ "$PWD/" = "$vent" ]; then
    cd ~vent
elif [ "$PWD/" = "$PATH" ]; then
    cd ~PATH
elif [ "$PWD/" = "$ZSH" ]; then
    cd ~ZSH
fi

# ----------------------------------------------------------------
# Theme settings
# ----------------------------------------------------------------
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs status)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'


# ----------------------------------------------------------------
# Plugins
# ----------------------------------------------------------------
plugins=(git chucknorris zsh-notify)

source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------------
# Others
# ----------------------------------------------------------------
set bell-style none
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vimx "$@"
    stty "$STTYOPTS"
}

alias glog="git log --graph --decorate --all --abbrev-commit"
