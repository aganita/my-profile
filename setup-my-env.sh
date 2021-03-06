#!/usr/bin/env bash

set -e # stop if error 
#set -x # verbose installation

GREEN=`tput setaf 2` # https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RESET_COLOR=`tput sgr0`

echo "Enter your working directory. Hit Enter for default setting (~/workspace)"
read dir_path
dir_path=${dir_path:-"~/workspace"}

dir_path=${dir_path/#\~/$HOME}

mkdir -p $dir_path

if [[ ! -d $dir_path/my-profile ]]; then
  git clone https://github.com/aganita/my-profile.git $dir_path/my-profile
fi

ln -sf $dir_path/my-profile/bash/.bash_profile $HOME/.bash_profile
ln -sf $dir_path/my-profile/settings/.my_aliases $HOME/.my_aliases
ln -sf $dir_path/my-profile/settings/.my_exports $HOME/.my_exports

brew install zsh
ln -sf $dir_path/my-profile/zshell/.zshrc $HOME/.zshrc

brew cask install vscodium
rm $HOME/Library/Application\ Support/VSCodium/User/settings.json || true
ln -sf $dir_path/my-profile/settings/vsc-settings.json $HOME/Library/Application\ Support/VSCodium/User/settings.json

read -p "${GREEN}====> Rebind Caps Lock key to Ctrl. [Press Enter to continue]"

read -p "====> Install iTerm2. [Press Enter to continue]"
ln -sf $dir_path/my-profile/settings/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist

read -p "====> Install font Meslo LG M DZ Regular for Powerline located at my-profile/settings. [Press Enter to continue]"

read -p "====> Install NodeJS: https://nodejs.org/en/download/. [Press Enter to continue]"

read -p "====> Install Spectacle: https://www.spectacleapp.com/. [Press Enter to continue]"

read -p "====> Install Brave: https://brave.com/download/. [Press Enter to continue]"
read -p "Copy over bookmarks for Brave. [Press Enter to continue]"

read -p "====> Install Chrome. [Press Enter to continue]"

read -p "====> Install Slack. [Press Enter to continue]${RESET_COLOR}"