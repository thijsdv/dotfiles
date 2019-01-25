# ----------------------------------------------------------------
# Exports
# ----------------------------------------------------------------
export TERM="xterm-256color"
export ZSH=/home/$USER/.oh-my-zsh
export PATH=/usr/lib64/qt-3.3/bin:/home/$USER/gcc-arm-none-eabi-4_9-2014q4/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/$USER/.local/bin:/home/$USER/bin:/home/$USER/Documents/project/smart-fan/common/esp8266/tools/xtensa-lx106-elf/xtensa-lx106-elf/bin/
export site=/home/$USER/Documents/EmbeddedAcademyWebsite/EmbeddedAcademySite/
export common=/home/$USER/Documents/courses/isy-academy-common/

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
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time virtualenv)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs status)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'


# ----------------------------------------------------------------
# Plugins
# ----------------------------------------------------------------
plugins=(git chucknorris zsh-notify virtualenv)

source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------------
# Others
# ----------------------------------------------------------------
set bell-style none
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

alias glog="git log --graph --decorate --all --abbrev-commit"
alias clean="./make.sh clean"
alias mk="./make.sh"
alias deploy="./make.sh deploy"
alias mini="sudo minicom -D /dev/ttyUSB0"

eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
