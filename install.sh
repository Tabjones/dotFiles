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

info 'Backup old dotfiles'
info '==================='
mv ${HOME}/.vim ${HOME}/dotFiles/backup/dotVim -f
mv ${HOME}/.vimrc ${HOME}/dotFiles/backup/dotVimrc -f
mv ${HOME}/.gvimrc ${HOME}/dotFiles/backup/dotGVimrc -f
mv ${HOME}/.gitconfig ${HOME}/dotFiles/backup/dotGitconfig -f
mv ${HOME}/.zshrc ${HOME}/dotFiles/backup/dotZshrc -f

info 'Setting up Symlinks in HOME'
info '==========================='
ln -sfn ${HOME}/dotFiles/vim ${HOME}/.vim
ln -sf ${HOME}/dotFiles/vim/vimrc ${HOME}/.vimrc
ln -sf ${HOME}/dotFiles/vim/gvimrc ${HOME}/.gvimrc
ln -sf ${HOME}/dotFiles/git/gitconfig ${HOME}/.gitconfig
cp -f ${HOME}/dotFiles/zsh/zshrc ${HOME}/.zshrc
success ' '

#Vim
cd ${HOME}/.vim
./scripts/setup.sh

cd ${HOME}/dotFiles/zsh
./setup.sh

cd  ..
