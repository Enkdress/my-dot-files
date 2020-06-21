alias la="ls -a"
alias ls="ls --color"
alias e="exit"

alias v="nvim"

alias i3conf="v ~/.dotFiles/.config/i3/config"

# GIT ALIASES
alias gst="git status"
alias gaa="git add ."
alias gcm="git commit -m"
alias gtp="git push"

# Change layout
alias es="localectl --no-convert set-x11-keymap es pc105"
alias us="localectl --no-convert set-x11-keymap us pc104"

# Install nodejs and npm for every terminal emulator
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

