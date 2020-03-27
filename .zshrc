# Path
export ANDROID_HOME=/Users/ryandunn/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
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
alias projects="cd ~/Documents/projects"
alias rnm="rm -rf node_modules"

#Raildiary helpers
alias rdw="cd ~/Documents/projects/raildiary-web"
alias rdc="cd ~/Documents/projects/raildiary-cms"
alias sda="cd ~/Documents/projects/sitediary-app"
alias ym="yarn middleware"
alias cp="docker-compose exec php-fpm clean-pimcore"

# Docker helpers
alias dcsp="docker-compose stop"
alias dcst="docker-compose start"

# Git helpers
alias gcleanraw="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch"
alias gclean="gcleanraw -d"

alias gps="git push"
alias gpsu="gps -u origin HEAD"

alias gpl="git pull"
alias gplo="git pull origin" #branch-name
alias gplod="gplo develop"

alias gc="git checkout"
alias gb="gc -b"
alias gcd="gc develop"