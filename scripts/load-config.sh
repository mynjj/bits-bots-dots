#!/usr/bin/zsh

CONFIGS_FOLDER="$(dirname $(dirname $(realpath "$0")))/configs"

mystow(){
  stow --ignore=README.md -t $HOME -d $CONFIGS_FOLDER -S $1
}

mystow emacs
mystow i3
mystow kitty
mystow rofi
mystow vim
mystow x11
mystow zsh
