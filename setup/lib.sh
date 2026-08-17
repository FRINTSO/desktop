#!/usr/bin/env bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link() {
	local src="$DOTFILES/$1"
	local dst="$2"

	if [[ ! -e "$src" ]]; then
		echo "ERROR: source does not exist: $src" >&2
		return 1
	fi

	mkdir -p "$(dirname "$dst")"

	if [[ -L "$dst" ]]; then
		# Already a symlink, overwrite is safe
		ln -sfn "$src" "$dst"
	elif [[ -e "$dst" ]]; then
		# Real file or dir, back it up
		echo "BACKUP: $dst -> $dst.bak"
		mv "$dst" "$dst.bak"
		ln -sfn "$src" "$dst"
	else
		ln -sfn "$src" "$dst"
	fi

	echo "  $dst -> $src"
}
