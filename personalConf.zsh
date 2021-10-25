alias la="l -a"
alias ls="ls --color"
alias e="exit"

alias v="nvim"
alias vn="nvim ~/Documents/notes"

alias i3conf="v ~/.dotFiles/.config/i3/config"
alias c="sudo rm -r ~/Documentos/http/search-engine; sudo cp -r ~/Documentos/search-engine /srv/http/"

# GIT ALIASES
alias gst="git status"
alias gaa="git add ."
alias gcm="git commit -m"
alias gp="git push"
alias gck="git checkout"

# Change layout
alias es="setxkbmap -layout latam"
alias us="setxkbmap -layout en"

# Install nodejs and npm for every terminal emulator
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR='nvim'
export TERM='xterm-256color'
