# Make sure the path array has only unique entries
typeset -U path

[[ -e /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# init brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load the shell dotfiles
# Note: This is currently done at the end since the ls command otherwise gets overwritten by zsh syntax highlighting
for file in ~/.{path,exports,aliases,functions,unsynced}.sh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
