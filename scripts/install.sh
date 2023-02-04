#!/bin/bash
# install.sh installs programs. Currently only supports ubuntu and mac

set -eu

platform=$(uname | tr '[:upper:]' '[:lower:]')

set -x

if [[ "$platform" == "linux" ]]; then
  echo "installing for Ubuntu"
  sudo apt-get -y update
  sudo apt-get -y install git
  sudo apt-get -y install ack-grep
  sudo apt-get -y install software-properties-common
  sudo apt-add-repository -y ppa:neovim-ppa/stable
  sudo apt-get -y update
  sudo apt-get -y install neovim
  sudo apt-get -y install vim
  sudo apt-get -y install silversearcher-ag
  sudo apt-get -y install zsh
  sudo apt-get -y install curl
  sudo apt-get -y install i3
  sudo apt-get -y install i3blocks
  sudo apt-get -y install blueman
  sudo apt-get -y install feh
  sudo apt-get -y install scrot
elif [[ "$platform" == "darwin" ]]; then
  echo "installing for mac"
  # install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew update
  brew install zsh
  brew install git
  brew install neovim
  brew install ack
  brew install the_silver_searcher
fi
