#!/usr/bin/env bash
set -euo pipefail

echo "Creating core directory structure..."
mkdir -p ~/.arc/{desktop,public}
mkdir -p ~/box/{in,repo}
mkdir -p ~/src/{lab,projects,repos,scripts}
mkdir -p ~/ref/docs
mkdir -p ~/ref/img/{pics,shot,wall,vid}
mkdir -p ~/ref/lib
mkdir -p ~/ref/templates
mkdir -p ~/.config
mkdir -p ~/.local/{bin,share,state,var}
mkdir -p ~/.cache
mkdir -p ~/sync/{box,src,ref}

mkdir -p ~/.ssh
chmod 700 ~/.ssh

export GNUPGHOME="$HOME/.local/share/gnupg"
mkdir -p "$GNUPGHOME"
chmod 700 "$GNUPGHOME"

echo "Cloning configs..."
git clone https://github.com/x0d167/nixconfig ~/.config/nixconfig
git clone https://github.com/x0d167/nvim-config ~/.config/nvim

echo "Done. Add the new host under nixconfig/hosts/, then run:"
echo "  sudo nixos-rebuild switch --flake ~/.config/nixconfig#<hostname>"
