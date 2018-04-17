# Make sure the path array has only unique entries
typeset -U path

# Make export variables available
source ~/.exports.sh

# virtualenv wrapper setup
source /usr/local/bin/virtualenvwrapper.sh

# ZSH setup
ZSH_THEME="" # empty because of pure prompt
plugins=(git)
source $ZSH/oh-my-zsh.sh

# pure prompt
autoload -U promptinit; promptinit
prompt pure

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load the shell dotfiles
# Note: This is currently done at the end since the ls command otherwise gets overwritten by zsh syntax highlighting
for file in ~/.{path,exports,aliases,functions,unsynced}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
