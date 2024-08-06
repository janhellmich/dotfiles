# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

znap prompt sindresorhus/pure

# znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions

# ZSH custom tab completions
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit

# Load other files
export DOTFILES=${0:a:h:h}
source $DOTFILES/zsh/exports.sh
source $DOTFILES/zsh/aliases.sh
source $DOTFILES/zsh/functions.sh
