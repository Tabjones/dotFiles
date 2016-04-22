" Set all plugins.
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}

Plug 'nanotech/jellybeans.vim'

Plug 'tpope/vim-fugitive'

Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ctrlpvim/ctrlp.vim' | Plug 'JazzCore/ctrlp-cmatcher' {'do': './install.sh'}

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

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'matze/vim-move'

Plug 'taketwo/vim-ros'

" Todo tmux
call plug#end()
