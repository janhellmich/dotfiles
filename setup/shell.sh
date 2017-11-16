#!/usr/bin/env bash

# Make the brew installed ZSH the default shell environment
BREW_ZSH='/usr/local/bin/zsh'
sudo bash -c "echo $BREW_ZSH >> /etc/shells"
chsh -s $BREW_ZSH

# Install oh-my-zsh and pure command prompt (reloads shell)
npm install --global pure-prompt
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
