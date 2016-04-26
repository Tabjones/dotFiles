#!/usr/bin/env bash
#
# setup the Vim GodMode Configuration

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

echo ''
info 'Setting up the Vim Configuration'
info '================================'
echo ''

info 'Installing Vim-Plug'
info '-------------------'
curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

info 'Installing SilverSearcher and Exuberant CTags'
info '---------------------------------------------'
sudo apt-get install -y silversearcher-ag exuberant-ctags


info 'Installing Plugins'
info '------------------'
info '(Ignore Vim errors)'
if test $(which vim)
then
  vim +PlugInstall +qall
else
  fail 'vim not found in path.'
fi

echo ''
info 'Configuring Fonts'
info '================='
echo ''
cd ~/.vim/fonts
./install.sh

cd -
success 'Setup complete. Run vim and enjoy'
