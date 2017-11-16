# Dotfiles

## How to run

1. move `~/.ssh` folder to new machine
1. install xcode, accept license agreement, and install command line tools with `xcode-select --install`
1. clone this repo to `~/dotfiles` and cd into it
1. run `bash setup/bootstrap.sh`
1. set up iterm to point it's preference folder to the dotfiles/iterm2 folder
1. run `source setup/macos.sh` to install mac setups
1. run `mackup restore` to sync previous application settings
1. restart