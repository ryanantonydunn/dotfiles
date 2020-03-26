#!/bin/sh

add_dock_item() {
    defaults write com.apple.dock persistent-apps -array-add '
        <dict><key>tile-data</key><dict><key>file-data</key><dict>
        <key>_CFURLString</key><string>$1</string><key>_CFURLStringType
        </key><integer>0</integer></dict></dict></dict>'
}

echo "Setting up Dock icons"

defaults write com.apple.dock persistent-apps -array
add_dock_item /System/Applications/Contacts.app
add_dock_item /System/Applications/Mail.app
add_dock_item /System/Applications/Calendar.app
add_dock_item /Applications/Slack.app
killall Dock

echo "Finished"
