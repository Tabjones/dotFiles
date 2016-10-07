"               ________ ++     ________
"             /VVVVVVVV\++++  /VVVVVVVV\
"             \VVVVVVVV/++++++\VVVVVVVV/
"              |VVVVVV|++++++++/VVVVV/''
"              |VVVVVV|++++++/VVVVV/''
"             +|VVVVVV|++++/VVVVV/''+
"           +++|VVVVVV|++/VVVVV/''+++++
"         +++++|VVVVVV|/VVV___++++++++++
"           +++|VVVVVVVVVV/##/ +_+_+_+_
"             +|VVVVVVVVV___ +/#_#,#_#,\
"              |VVVVVVV//##/+/#/+/#/''/#/
"              |VVVVV/''+/#/+/#/+/#/ /#/
"              |VVV/''++/#/+/#/ /#/ /#/
"              ''V/''  /##//##//##//###/
"                      ++
"                      ''       CONFIGURATION
"
"  Be (Im)proved!
set nocompatible
filetype plugin indent on
syntax enable
set ff=dos
" ------------------------------------------------------------------------------
"                                                                       Commands
" ------------------------------------------------------------------------------
" Silently execute an external command
" No 'Press Any Key to Contiue BS'
" from: http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command! -nargs=1 SilentCmd
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
" Fixes common typos
command! W w
command! Q q
" ----------------------------------------
" Auto Commands
" ----------------------------------------
if has("autocmd")
  augroup MyAutoCommands
    " Clear the auto command group so we don't define it multiple times
    " Idea from http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
    autocmd!
    " No formatting on o key newlines
    autocmd BufNewFile,BufEnter * set formatoptions-=o
    " No more complaining about untitled documents
    " Autosaves when you lose focus to the window
    autocmd FocusLost * :wa
    au  BufRead,BufNewFile *.hpp set filetype=cpp
    au  BufRead,BufNewFile *.vim set filetype=vim
  augroup END
endif
" ------------------------------------------------------------------------------
"                                                                          Color
" ------------------------------------------------------------------------------
" Force 256 color mode if available
if $TERM =~ "-256color"
   set t_Co=256
endif
" ------------------------------------------------------------------------------
"                                                                          Fonts
" ------------------------------------------------------------------------------
set guifont=Inconsolata-g\ for\ Powerline
let g:Powerline_symbols = 'fancy'
" ------------------------------------------------------------------------------
"                                                                 File Locations
" ------------------------------------------------------------------------------
set backupdir=~/.vim/.backup// " Double // causes backups to use full file path
set directory=~/.vim/.tmp//
" Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif
" ------------------------------------------------------------------------------
"                                                                             UI
" ------------------------------------------------------------------------------
set encoding=utf-8 " Use the right encoding
set ruler          " Ruler on
set relativenumber " Line numbers on, but relative to where your cursor is
set number         " Hybrid mode Line numbers! Relative plus current absolute
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif
"remove gui bars
set guioptions -=m "menubar"
set guioptions -=T "Toolbar"
set guioptions -=r "right scrollbar"
set guioptions -=L "Left scrollbar"
set guioptions -=b "bottom scrollbar"
" ------------------------------------------------------------------------------
"                                                                      Behaviors
" ------------------------------------------------------------------------------
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=10000      " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
" set timeoutlen=450     " Time to wait for a command (after leader for example).
set ttimeout
set ttimeoutlen=100    " Time to wait for a command (after leader for example).
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set formatoptions=crql
set iskeyword+=\$,-    " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=10       " Keep n lines below the last line when scrolling
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists
set ttyfast
set ssop=buffers,folds,resize,sesdir,tabpages,winpos,winsize
" Better complete options to speed it up
set complete=.,w,b,u,U
" ------------------------------------------------------------------------------
"                                                                    Text Format
" ------------------------------------------------------------------------------
set tabstop=4
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=4               " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab
set formatprg=par\ -w80         "par formatting
" ------------------------------------------------------------------------------
"                                                                      Searching
" ------------------------------------------------------------------------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,*.zip,*.aux
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
  \rake-pipeline-*
" ------------------------------------------------------------------------------
"                                                                         Visual
" ------------------------------------------------------------------------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list
" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw
" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<
" ------------------------------------------------------------------------------
"                                                                         Sounds
" ------------------------------------------------------------------------------
set noerrorbells
set novisualbell
set t_vb=
" ------------------------------------------------------------------------------
"                                                                          Mouse
" ------------------------------------------------------------------------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes
" ------------------------------------------------------------------------------
"                                                                       Mappings
" ------------------------------------------------------------------------------
" Set leader to spacebar
" Note: This line MUST come before any <leader> mappings
let mapleader="\<Space>"
" ---------------
" Regular Mappings
" ---------------
" Yank entire buffer with gy
nnoremap gy :0,$ y<cr>
" Select entire buffer
nnoremap vy ggVG
" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$
" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $
" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
" Move on visual lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
" ---------------
" Window Movement
" ---------------
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
" Previous Window
nnoremap <silent> <C-p> :wincmd p<CR>
" Equal Size Windows
nnoremap <silent> <C-=> :wincmd =<CR>
" New Tab
nnoremap <silent> <leader>te :tabnew<CR>
" Next Tab
nnoremap <silent> <leader>tn :tabn<CR>
" Prev Tab
nnoremap <silent> <leader>tp :tabp<CR>
" ---------------
" Insert Mode Mappings
" ---------------
" Let's make escape better.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap jj <Esc>
inoremap JJ <Esc>

" ---------------
" Leader Mappings
" ---------------
" Create newlines without entering insert mode
nnoremap <silent><leader>o o<Esc>k
nnoremap <silent><leader>O O<Esc>j
" Clear search
noremap <silent><leader>nh :nohls<CR>
" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>
" Toggle spelling mode with <leader>spe
nnoremap <silent> <leader>s :set spell!<CR>
" Replace placeholders <+...+>
nnoremap <silent> <Leader>ph /<+.\{-1,}+><cr>c/+>/e<cr>
" Format the entire file
nnoremap <leader>fef mx=ggG='x
" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>hs :split<Bar>:wincmd j<CR>
nnoremap <silent> <leader>vs :vsplit<Bar>:wincmd l<CR>
" Close everything and quits (prompts if modified)
nnoremap <silent> <Leader>qq :qall<CR>
" Save&Close everything
nnoremap <silent> <Leader>wq :wqall<CR>
" Save everything
nnoremap <silent> <Leader>ww :wall<CR>
" Par reformatting
map <leader>par {v}!par -jw80<CR>
vmap <leader>par !par -jw80<CR>
" Cut/Copy/Paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Enter Visual Line  with leader leader
nmap <Leader><Leader> V
"  source current file
nnoremap <silent><leader>rr  :source %<cr>
" ---------------
" Typo Fixes
" ---------------
noremap <F1> <Esc>
inoremap <F1> <Esc>
cnoremap w' w<CR>
" Disable the  ever-annoying Ex mode  shortcut key.  Instead, make Q  repeat the
" last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@
" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k
