#!/usr/bin/env bash
#
#  Setup GodMode

info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

info 'Setting up Symlinks in HOME'
info '---------------------------'
ln -sf vim ${HOME}/.vim
ln -sf vim/vimrc ${HOME}/.vimrc
ln -sf vim/gvimrc ${HOME}/.gvimrc

#Vim
./vim/scripts/setup.sh
