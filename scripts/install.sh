#!/bin/bash
# install.sh installs programs. Currently only supports ubuntu and mac

set -eu

platform=$(uname | tr '[:upper:]' '[:lower:]')

set -x

if [[ "$platform" == "linux" ]]; then
  echo "installing for Ubuntu"
  sudo apt-get -y install ack-grep
  sudo apt-get -y install software-properties-common
  sudo apt-add-repository -y ppa:neovim-ppa/stable
  sudo apt-get -y update
  sudo apt-get -y install neovim
  sudo apt-get -y install python-dev python-pip python3-dev python3-pip
  sudo apt-get -y install vim
elif [[ "$platform" == "macos" ]]; then
  echo "installing for mac"
  brew install neovim
  brew install ack
fi
