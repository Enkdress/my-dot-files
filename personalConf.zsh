alias la="ls -a"
alias ls="ls --color"
alias e="exit"

alias v="nvim"

alias pr="nvim ~/Documentos/work/flights-ui"

# GIT ALIASES
alias gst="git status"
alias gaa="git add ."
alias gcm="git commit -m"
alias gtp="git push"

# Install nodejs and npm for every terminal emulator
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias in="nvm install node"
