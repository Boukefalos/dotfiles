#!/usr/bin/env bash
set -e

# Backup files that are provided by the dotfiles into a ~/dotfiles-backup directory

DOTFILES=$HOME/.dotfiles
BACKUP_DIR=$HOME/dotfiles-backup

echo "Creating backup directory at $BACKUP_DIR"
mkdir -p $BACKUP_DIR

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

for file in $linkables; do
    filename=".$( basename $file '.symlink' )"
    target="$HOME/$filename"
    if [ -e $target ]; then
        echo "backing up $filename"
        cp $target $BACKUP_DIR
    fi
done

typeset -a files=($HOME/.vim $HOME/.vimrc)
for file in $files; do
    if [ -e $file ]; then
        cp -rf $file $BACKUP_DIR
    fi
done
