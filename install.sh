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

#preliminary install
info 'Installing necessary packages'
info '============================='
sudo apt-get install -y build-essential cmake curl dos2unix fortune cowsay git gitg openssh-client opensse-server python python3 vim

info 'Setting up Symlinks in HOME'
info '==========================='
ln -sfn ${HOME}/dotFiles/vim ${HOME}/.vim
ln -sf ${HOME}/dotFiles/vim/vimrc ${HOME}/.vimrc
ln -sf ${HOME}/dotFiles/bash/bashrc ${HOME}/.bashrc
ln -sf ${HOME}/dotFiles/bash/bash_alias ${HOME}/.bash_alias
ln -sf ${HOME}/dotFiles/bash/bash_custom ${HOME}/.bash_custom
ln -sf ${HOME}/dotFiles/git/gitconfig ${HOME}/.gitconfig
success ' '

#Vim
echo ''
info 'Setting up Vim Configuration'
info '============================'
echo ''

info 'Installing Vim-Plug'
info '-------------------'
curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
success ' '

info 'Installing SilverSearcher and Exuberant CTags'
info '---------------------------------------------'
sudo apt-get install -y silversearcher-ag exuberant-ctags
success ' '

info 'Installing Plugins'
info '------------------'
info '(Ignore Vim errors)'
if test $(which vim)
then
  vim +PlugInstall +qall
else
  fail 'vim not found in path.'
fi
success ' '

