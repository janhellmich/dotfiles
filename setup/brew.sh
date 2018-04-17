#!/usr/bin/env bash

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew update
brew tap homebrew/bundle

# Taps
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap homebrew/bundle

# Install ZSH
brew install zsh
brew install zsh-syntax-highlighting

# Install GNU core utilities (those that come with macOS are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install more recent versions of some macOS tools
brew install grep

# Install Binaries
brew install git
brew install tree
brew install mackup
brew install mas
brew install node
brew install npm
brew install python3
brew install trash
brew install wget
brew install jq
brew install vim
brew install the_silver_searcher
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Apps
brew cask install atom
brew cask install docker
brew cask install firefox
brew cask install flux
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install keepingyouawake
brew cask install sequel-pro
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install torbrowser
brew cask install visual-studio-code
brew cask install vlc
brew cask install qbittorrent

# Fonts
brew cask install font-source-code-pro-for-powerline
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

# Install Mac App Store apps
mas '1Password', id: 443987910
mas 'Kiwi for Gmail', id: 986304488
