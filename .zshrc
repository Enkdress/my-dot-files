export TERM="xterm-256color"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="nvim"
export VISUAL="nvim"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### SET VI MODE ###
bindkey -v

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi
#
### OH MY ZSH ###
ZSH=$HOME/.oh-my-zsh

# export NVM_LAZY=1
plugins=(
         fzf
         git
         git-prompt
         zsh-autosuggestions
         zsh-syntax-highlighting
       )

# Sourcing oh-my-zsh
# Your plugins will not work without this source.
source $ZSH/oh-my-zsh.sh

### ALIASES ###
source ./aliases.zsh

## Env Variables
source ./enviroment-variables/init.zsh
export PATH="/usr/local/opt/libpq/bin:$PATH"

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init zsh)"
