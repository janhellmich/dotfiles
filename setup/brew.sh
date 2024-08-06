#!/usr/bin/env bash

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# init brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install homebrew packages
brew update
brew tap homebrew/bundle

# Taps
brew tap homebrew/cask-fonts

# Install GNU core utilities (those that come with macOS are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install more recent versions of some macOS tools
brew install grep

# Install Binaries
brew install git
brew install node
brew install npm
brew install nvm
brew install pyenv
brew install wget
brew install ripgrep
brew install jq
brew install fd
brew install fzf
brew install the_silver_searcher
brew install bat
brew install neovim

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Fonts
brew install --cask font-jetbrains-mono
