# Path
export ANDROID_HOME=/Users/ryandunn/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

NVM_HOMEBREW="/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_HOMEBREW" ] && \. "$NVM_HOMEBREW"

# Path to oh-my-zsh installation
export ZSH="/Users/ryandunn/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Functions
pin_dock_item() {
    app_location=null
    dirs=(/Applications /System/Applications /System/Applications/Utilities)
    for dir in $dirs; do
        app=$dir'/'$1'.app';
        if [ -d $app ]; then
            app_location=$app
        fi
    done

    if [ $app_location = null ]; then
        echo 'App '$1' not found'
    else
        echo 'Pinning '$app_location' to dock'
        defaults write com.apple.dock persistent-apps -array-add \
            "<dict><key>tile-data</key><dict><key>file-data</key><dict>\
            <key>_CFURLString</key><string>"$app_location"</string><key>_CFURLStringType</key>\
            <integer>0</integer></dict></dict></dict>"
    fi
}

set_dock() {
    echo "Pinning dock items"
    defaults write com.apple.dock persistent-apps -array
    for var in "$@"
    do
        pin_dock_item $var
    done
    echo "Restarting dock"
    killall Dock
}


# Aliases
# ===================

# Misc helpers
alias mdt="cd ~/code/my-daily-tracker"
alias rnm="rm -rf node_modules"

# Docker helpers
alias dsp="docker-compose stop"
alias dst="docker-compose start"
alias dockernuke="docker system prune --all && docker volume prune"

# Git helpers
alias gcleanraw="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch"
alias gclean="gcleanraw -d"

alias gf="git fetch --all"

alias gcm="git add -A && git commit -m"

alias gps="git push"
alias gpsu="gps -u origin HEAD"

alias gpl="git pull"
alias gplo="git pull origin" #branch-name
alias gplod="gplo develop"

alias gc="git checkout"
alias gb="gc -b"
alias gcd="gc develop"