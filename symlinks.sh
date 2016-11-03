#!/bin/bash
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

info 'Creating symlinks'
info '================='

ln -sfn ${HOME}/dotFiles/vim ${HOME}/.vim
ln -sf ${HOME}/dotFiles/vim/vimrc ${HOME}/.vimrc
ln -sf ${HOME}/dotFiles/bash/bashrc ${HOME}/.bashrc
ln -sf ${HOME}/dotFiles/bash/bash_alias ${HOME}/.bash_alias
ln -sf ${HOME}/dotFiles/bash/bash_custom ${HOME}/.bash_custom
ln -sf ${HOME}/dotFiles/git/gitconfig ${HOME}/.gitconfig
success ' '
