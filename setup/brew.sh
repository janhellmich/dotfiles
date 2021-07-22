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
brew tap homebrew/cask
brew tap homebrew/cask-fonts
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
brew install tmux
brew install tree
brew install node
brew install npm
brew install python3
brew install wget
brew install ripgrep
brew install jq
brew install fd
brew install bat
brew install vim
brew install neovim
brew install the_silver_searcher
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Apps
brew install --cask docker
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask slack
brew install --cask spectacle
brew install --cask spotify

# Fonts
brew install --cask font-hack-nerd-font
