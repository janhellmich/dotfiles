# Dotfiles

## Set up a new mac from scratch

1. clone this repo and cd into it: `git clone git@github.com:janhellmich/dotfiles.git ~/dotfiles`
1. run `source setup/brew.sh` to setup homebrew and some initial binaries / apps
1. you can run `bash setup/symlink.sh` to setup the dotfiles
  - use the `-d` flag for detached mode. This will copy files vs. symlink them
  - use the `-b` flag to make backups of existing files
1. run `source setup/shell.sh` to make ZSH the default shell and download the pretzo theme
1. configure neovim by following this: https://github.com/luan/nvim
1. setup tmux plugin manager by following this: https://github.com/tmux-plugins/tpm
1. set up iterm to point it's preference folder to the dotfiles/iterm2 folder: `iterm2 -> preferenes -> general -> preferences`
1. [Optional] run `source setup/macos.sh` to configure mac rettings
1. restart


