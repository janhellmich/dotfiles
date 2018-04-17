#!/usr/bin/env bash

export DOTFILES=$HOME/dotfiles

GLOBIGNORE=.:..:.git:.gitmodules

detached='false'
backup='false'

while getopts "bd" flag; do
    case $flag in
        b) backup='true' ;;
        d) detached='true' ;;
        *) error "Invalid option $flag" ;;
    esac
done

cd $DOTFILES/sync/
for file in .*; do
    [ -e "$file" ] || continue
    if [ -e "$HOME/$file" ] && [ "$backup" = 'true' ]; then
        echo "backup $HOME/$file" → "$HOME/$file.backup"
        mv "$HOME/$file" "$HOME/$file.backup"
    fi

    if [ "$detached" = 'true' ]; then
        echo "copy $DOTFILES/sync/$file → $HOME/$file"
        cp -iR "$DOTFILES/sync/$file" "$HOME/$file"
    else
        echo "link $DOTFILES/sync/$file → $HOME/$file"
        ln -sniF "$DOTFILES/sync/$file" "$HOME/$file"
    fi
done

# Add a file that allows to specify commands, functions, etc that are not synced across systems
[ -e "$HOME/.unsynced.sh" ] || touch "$HOME/.unsynced.sh"

