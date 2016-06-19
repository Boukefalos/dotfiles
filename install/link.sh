#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi
# configs=$( find -path "$DOTFILES/config.symlink" -maxdepth 1 )
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

echo -e "\n\nCreating vim symlinks"
echo "=============================="
typeset -A vimfiles
vimfiles[~/.vim]=$DOTFILES/config/vim
vimfiles[~/.vimrc]=$DOTFILES/config/vim/init.vim

for file in "${!vimfiles[@]}"; do
    if [ -e ${file} ]; then
        echo "${file} already exists... skipping"
    else
        echo "Creating symlink for $file"
        ln -s ${vimfiles[$file]} $file
    fi
done

echo -e "\n\nCreating tmux symlinks"
echo "=============================="
file=~/.tmux/
if [ -e ${file}/plugins ]; then
    echo "${file}/plugins already exists... skipping"
else
    mkdir -p ~/.tmux/
  echo "Creating symlink for $file/plugins"
    ln -s $DOTFILES/tmux/plugins $file
fi
