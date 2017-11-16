#!/usr/bin/env bash

cd "$(dirname $0)";

echo "Running a full setup..."

echo "Installing some tools and applications..."
source brew.sh
echo "done"

echo "Symlinking all dotfiles..."
source symlink.sh
echo "done"

echo "Setting up your shell..."
source shell.sh