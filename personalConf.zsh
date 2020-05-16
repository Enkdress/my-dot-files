alias la="ls -a"
alias ls="ls --color"
alias e="exit"

alias v="nvim"

alias pr="nvim ~/Documentos/work/flights-ui"

# Install nodejs and npm for every terminal emulator
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias in="nvm install node"
