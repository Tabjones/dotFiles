" Set all plugins.
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}

Plug 'altercation/vim-colors-solarized'

" Not a vim plugin, but usefull to install  here
Plug 'Anthony25/gnome-terminal-colors-solarized', {'do': './install.sh'}

Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'

Plug 'tpope/vim-vinegar'

Plug 'benmills/vimux'

Plug 'christoomey/vim-tmux-navigator'

Plug 'ctrlpvim/ctrlp.vim' | Plug 'JazzCore/ctrlp-cmatcher', {'do': './install.sh'}

Plug 'airblade/vim-gitgutter'

Plug 'rking/ag.vim'

Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'Raimondi/delimitMate'

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-endwise'

Plug 'osyo-manga/vim-anzu'

Plug 'mbbill/undotree'

Plug 'Valloric/MatchTagAlways'

Plug 'AndrewRadev/switch.vim'

Plug 'gabrielelana/vim-markdown'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'taketwo/vim-ros'

" Todo tmux
" To make more friendly generated ymc conf
call plug#end()
