#!/usr/bin/env bash

export DOTFILES=$HOME/dotfiles

cd $DOTFILES
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

for file in .*; do
    [ -e "$file" ] || continue
    if [ -e "$HOME/$file" ] && [ "$backup" = 'true' ]; then
        echo "backup $HOME/$file" → "$HOME/$file.backup"
        mv "$HOME/$file" "$HOME/$file.backup"
    fi

    if [ "$detached" = 'true' ]; then
        echo "copy $DOTFILES/$file → $HOME/$file"
        cp -iR "$DOTFILES/$file" "$HOME/$file"
    else
        echo "link $DOTFILES/$file → $HOME/$file"
        ln -shi "$DOTFILES/$file" "$HOME/$file"
    fi
done
