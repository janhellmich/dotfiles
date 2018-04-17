# Dotfiles

## Set up a new mac from scratch

1. move `~/.ssh` folder to new machine
1. install xcode, accept license agreement, and install command line tools with `xcode-select --install`
1. clone this repo and cd into it: `git clone --recurse-submodules git@github.com:janhellmich/dotfiles.git ~/dotfiles`
1. run `bash setup/bootstrap.sh`
1. set up iterm to point it's preference folder to the dotfiles/iterm2 folder
1. run `source setup/macos.sh` to install mac setups
1. run `mackup restore` to sync previous application settings
1. restart

## Set up dotfiles without installing applications and packages

1. clone this repo and cd into it: `git clone --recurse-submodules git@github.com:janhellmich/dotfiles.git ~/dotfiles`
1. run `bash setup/symlink.sh`
  - use the `-d` flag for detached mode. This will copy files vs. symlink them
  - use the `-b` flag to make backups of existing files