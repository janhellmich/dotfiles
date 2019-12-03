#!/usr/bin/env bash

# Make the brew installed ZSH the default shell environment
brew install zsh
BREW_ZSH='/usr/local/bin/zsh'
sudo bash -c "echo $BREW_ZSH >> /etc/shells"
chsh -s $BREW_ZSH

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

