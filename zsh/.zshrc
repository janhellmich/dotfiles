# ZSH custom tab completions
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit

# Load other files
export DOTFILES=${0:a:h:h}
source $DOTFILES/zsh/exports.sh
source $DOTFILES/zsh/aliases.sh
source $DOTFILES/zsh/functions.sh
