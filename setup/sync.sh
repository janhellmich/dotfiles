#!/usr/bin/env bash

cd "$(dirname $0)";

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
		--exclude "install.sh" \
		--exclude "sync.sh" \
		--exclude "Brewfile" \
		--exclude "readme.md" \
		--exclude "license.txt" \
		--exclude "mackup" \
		-avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;