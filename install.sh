#!/usr/bin/env bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if apropos "package manager" | grep -q apt; then
    echo -e "\n\nUsing APT package manager"

    source install/apt.sh
fi

source install/terminfo.sh
source install/ruby.sh
source install/link.sh

# echo "Configuring zsh as default shell"
# chsh -s $(which zsh)

echo "Done."
