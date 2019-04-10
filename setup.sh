#!/bin/sh

# execute before: xcode-select --install

# brew setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# install wget
brew install wget

# install zsh
brew install zsh
touch ~/.zshrc
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# git
brew install git
# large files for git
brew install git-lfs

# nvm - node.js with switcher
brew install nvm
mkdir ~/.nvm
echo -e '\n######## nvm config ########' >> ~/.zshrc
echo -e 'export NVM_DIR="$HOME/.nvm"\n. "/usr/local/opt/nvm/nvm.sh"' >> ~/.zshrc
source ~/.zshrc
# Now using node v8.10.0 (npm v5.6.0) eg: for aws
# for latest lts use: nvm install --lts
nvm install 8.10

# install python3 (pip3)
brew install python3

# install dev-apps
brew install unrar
brew install trash
brew install tree
brew install tig

# OSX native apps
function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask phantomjs
installcask docker
installcask google-chrome
installcask insomnia

# install Iterm2
installcask iterm2

#configure theme of zsh : powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -i -- 's/robbyrussell/powerlevel9k\/powerlevel9k/g' ~/.zshrc
brew tap caskroom/fonts
brew cask install font-hack-nerd-font font-meslo-for-powerline font-meslo-lg font-meslo-nerd-font font-meslo-nerd-font-mono
mkdir iterm2-themes
wget -P iterm2-themes https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors

# install and configure vscode
installcask visual-studio-code
code --install-extension dbaeumer.vscode-eslint
code --install-extension orta.vscode-jest
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension equinusocio.vsc-material-theme
code --install-extension ahmadawais.shades-of-purple
code --install-extension dracula-theme.theme-dracula
code --install-extension vscode-icons-team.vscode-icons

# utils
installcask spotify
installcask vlc
installcask slack
installcask discord
installcask spectacle
