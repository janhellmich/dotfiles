#!/usr/bin/env bash

cd $DOTFILES
GLOBIGNORE=.:..:.git

for file in .*; do
    [ -e "$file" ] || continue
    echo "link $HOME/$file → $DOTFILES/$file..."
    # ln -s "$file" "$HOME/$file"
done