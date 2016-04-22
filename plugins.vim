" Set all plugins.
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer', 'for': 'cpp'}
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

Plug 'nanotech/jellybeans.vim'

Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'airblade/vim-gitgutter'

Plug 'rking/ag.vim'

Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'Raimondi/delimitMate'

Plug 'mhinz/vim-startify'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-endwise'

Plug 'osyo-manga/vim-anzu'

Plug 'mbbill/undotree'

Plug 'Valloric/MatchTagAlways'

Plug 'AndrewRadev/switch.vim'

Plug 'gabrielelana/vim-markdown'

" TODO at ctrlp cmatcher


call plug#end()
