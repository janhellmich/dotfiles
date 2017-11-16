# Make sure the path array has only unique entries
typeset -U path

# Load the shell dotfiles
for file in ~/.{path,exports,aliases,functions}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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
