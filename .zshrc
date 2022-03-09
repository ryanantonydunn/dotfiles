# Path
export ANDROID_HOME=/Users/ryan.dunn/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

NVM_HOMEBREW="/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_HOMEBREW" ] && \. "$NVM_HOMEBREW"

export ZSH="/Users/ryan.dunn/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# Aliases
# ===================

alias rnm="rm -rf node_modules"
alias sshkey="pbcopy < ~/.ssh/id_rsa.pub"

alias gf="git fetch --all"

alias gcm="git add -A && git commit -m"

alias gps="git push"
alias gpsu="gps -u origin HEAD"

alias gpl="git pull"
alias gplo="git pull origin" #branch-name
alias gplod="gplo develop"

alias gc="git checkout"
alias gb="gc -b"
alias gcm="gc master"
alias gcma="gc main"

alias gbf="git branch | grep" # branch name search
gbfd () { # delete git branches by search
    git branch | grep $1 | xargs git branch -D
}
alias gbd="git branch -D" #branch-name

# open any folder in pycharm
pycharm () {
    open -na "PyCharm CE" --args "$1"
}

