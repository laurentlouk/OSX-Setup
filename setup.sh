#!/bin/sh


# brew setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Apps
brew install git
brew install git-lfs
brew install python3
brew install nvm


# install node with nvm
mkdir ~/.nvm
touch ~/.zshrc
echo -e 'export NVM_DIR="$HOME/.nvm"\n. "/usr/local/opt/nvm/nvm.sh"\n' > ~/.zshrc
source ~/.zshrc
nvm install --lts

brew install phantomjs
brew install unrar
brew install trash
brew install tree
brew install wget
brew install tig

# OSX native apps
brew tap caskroom/cask

function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask visual-studio-code
installcask docker
installcask google-chrome
brew cask install postman

# utils
installcask skype
installcask spotify
installcask vlc
installcask slack
installcask discord
installcask spectacles