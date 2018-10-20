#!/usr/bin/env bash
set -e

DOTFILES_ROOT=$HOME/.dotfiles
OH_MY_ZSH="$HOME"/.oh-my-zsh

cd $HOME

# Check OS
# Works on macOS and Ubuntu
ostype=$(uname)
if [[ "$ostype"  == 'Darwin' ]]; then
  platform='macos'
elif [[ "$ostype" == 'Linux' ]]; then
  platform='linux'
else
  echo "OS " + $ostype + " is not supported"
  exit 1
fi

install_dotfiles() {
  mkdir -p "$OH_MY_ZSH"/custom
  mkdir -p "$HOME"/.config/nvim
  mkdir -p "$HOME"/.config/i3

  link_file "$DOTFILES_ROOT"/zsh/aliases.zsh "$OH_MY_ZSH"/custom/aliases.zsh
  link_file "$DOTFILES_ROOT"/zsh/.zshrc "$HOME"/.zshrc
  link_file "$DOTFILES_ROOT"/nvim/init.vim "$HOME"/.config/nvim/init.vim
  link_file "$DOTFILES_ROOT"/i3/config "$HOME"/.config/i3/config
  link_file "$DOTFILES_ROOT"/i3/i3blocks.conf "$HOME"/.config/i3/i3blocks.conf
  link_file "$DOTFILES_ROOT"/tmux/.tmux.conf "$HOME"/.tmux.conf
  link_file "$DOTFILES_ROOT"/git/gitconfig.sym "$HOME"/.gitconfig
  link_file "$DOTFILES_ROOT"/git/gitignore.sym "$HOME"/.gitignore
}

link_file() {
  local src=$1 dst=$2
  local overwrite=true

  if [ "$overwrite" == "true" ]; then
    rm -rf "$dst"
    echo "Removed $dst"
  fi

  ln -s "$1" "$2"
  echo "Linked $1 to $2"
}

install_oh_my_zsh() {
  if [ ! -d "$OH_MY_ZSH" ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  else
    echo "oh-my-zsh is already installed"
  fi
}

switch_to_zsh() {
  if [[ "$SHELL" =~ "zsh" ]]; then
    echo "Already using zsh"
  else
    chsh --s=`which zsh`
    echo "Switched the default shell to zsh"
  fi
}

init_nvim() {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim -c "PlugInstall | q | q"
}

copy_file() {
  local src=$1 dst=$2
  local overwrite=true

  if [ "$overwrite" == "true" ]; then
    cp -rf "$src" "$dst"
    echo "Copied $src to $dst"
  fi
}

install_oh_my_zsh
switch_to_zsh
install_dotfiles
init_nvim

echo "All installed"