#!/bin/sh

echo -e "\n\nInstalling APT packages..."
echo "=============================="

# cli tools
apt-get install tree
apt-get install wget
apt-get install curl

# development tools
apt-get install git
apt-get install tmux
apt-get install zsh
apt-get install ruby