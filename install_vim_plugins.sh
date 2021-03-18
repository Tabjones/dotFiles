#! /bin/bash

PACKAUTO=~/.vim/pack/git-plugins/start
PACKOPT=~/.vim/pack/git-plugins/opt
mkdir -p ${PACKAUTO}
mkdir -p ${PACKOPT}
#Ale
git clone --depth 1 https://github.com/dense-analysis/ale.git ${PACKAUTO}/ale
#Dracula
git clone https://github.com/dracula/vim.git ${PACKOPT}/dracula
