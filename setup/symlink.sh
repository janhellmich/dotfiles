#!/usr/bin/env bash

cd $DOTFILES
GLOBIGNORE=.:..:.git:.gitmodules

for file in .*; do
    [ -e "$file" ] || continue
    echo "link $HOME/$file → $DOTFILES/$file..."
    ln -shi "$DOTFILES/$file" "$HOME/$file"
done