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
" Functions
" ----------------------------------------
" Strip Trailing White Space
" ---------------
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
function! StripTrailingWhiteSpaceAndSave()
  :call Preserve("%s/\\s\\+$//e")<CR>
  :write
endfunction
command! StripTrailingWhiteSpaceAndSave :call StripTrailingWhiteSpaceAndSave()<CR>
nnoremap <silent> <leader>stw :silent! StripTrailingWhiteSpaceAndSave<CR>
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
    " When editing a file, always jump to the last cursor position.
    " This must be after the uncompress commands.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line ("'\"") <= line("$") |
          \   exe "normal! g`\"" |

    " Fix trailing whitespace in my most used programming langauges
    autocmd BufWritePre *.cpp,*.h,*.hpp,*.c,Makefile,CMakeLists.txt,*.py,
          \*.coffee,*.rb,*.erb,*.md,*.scss,*.vim,Cakefile,*.hbs,*.launch,
          \*.msg,*.srv
          \ silent! :StripTrailingWhiteSpace
  augroup END
endif
" ------------------------------------------------------------------------------
"                                                                          Color
" ------------------------------------------------------------------------------
set background=dark
colorscheme jellybeans
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
syntax enable
filetype plugin indent on
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
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
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
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
" Replace placeholders <++>
nnoremap <silent> <Leader>p /<++><CR>cf>
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
" ------------------------------------------------------------------------------
"                                                          Plugins Configuration
" ------------------------------------------------------------------------------

"Ctrl-P """"""""""""""""""""""""""""""""""""""
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
" Fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
" Leader Commands
nnoremap <leader>cp :CtrlP<CR>
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " HatTip: http://robots.thoughtbot.com/faster-grepping-in-vim and
  " @ethanmuller
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"Enable cmatcher plugin (must be installed externally)
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<leader>cf', '<c-up>', '<c-f>'],
    \ 'ToggleType(-1)':       ['<leader>cb', '<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<leader>cz', '<c-z>'],
    \ 'OpenMulti()':          ['<leader>co', '<c-o>'],
    \ 'PrtExit()':            ['<leader>cp', '<esc>', '<c-c>', '<c-g>'],
    \ }

"Fugitive """""""""""""""""""""""""""""""""""""
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gca :Gcommit -a -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1

" GitGutter """"""""""""""""
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_modified = '≈'

" AirLine """""""""""""""""""""""""""""""""""""
"let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_inactive_collapse = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensiona#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0

" NerdTree """"""""""""""""
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHijackNetrw = 0
" Close Vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif

" Indent Guides """"""""""""""""
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" UltiSnips """""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=["CustomUltiSnips"]
let g:UltiSnipsExpandTrigger="<leader>j"
let g:UltiSnipsJumpForwardTrigger="<leader>j"
let g:UltiSnipsJumpBackwardTrigger="<leader>k"
let g:UltiSnipsListSnippets="<leader><tab>"

"Startify """"""""""""""""""""
let g:startify_list_order = [
        \ ['   Recent Files'],
        \ 'files',
        \ ['   Bookmarks'],
        \ 'bookmarks',
        \ ]
let g:startify_bookmarks = [
            \'~/.vim/',
            \'~/catkin/',
            \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ ]
let g:startify_files_number = 8
let g:startify_custom_indices = ['a', 'd', 'f', 'g', 'h']
let g:startify_change_to_dir = 1
let g:startify_session_autoload = 1
hi StartifyFooter  ctermfg=171
hi StartifyHeader  ctermfg=152
hi StartifySlash   ctermfg=224
hi StartifyNumber  ctermfg=26
" Show Startify and NERDTree on start
autocmd VimEnter *
            \ if !argc() |
            \   Startify |
            \   NERDTree |
            \   execute "normal \<c-w>w" |
            \ endif
" Keep NERDTree from opening a split when startify is open
autocmd FileType startify setlocal buftype=
let g:startify_recursive_dir = 1
let g:startify_custom_footer =
      \ map(split(system('fortune | cowsay -f eyes'), '\n'), '"   ". v:val') + ['','']
let g:startify_custom_header = [
      \'        ________ ++     ________      ',
      \'       /VVVVVVVV\++++  /VVVVVVVV\     ',
      \'       \VVVVVVVV/++++++\VVVVVVVV/     ',
      \'        |VVVVVV|++++++++/VVVVV/''     ',
      \'        |VVVVVV|++++++/VVVVV/''       ',
      \'       +|VVVVVV|++++/VVVVV/''+        ',
      \'     +++|VVVVVV|++/VVVVV/''+++++      ',
      \'   +++++|VVVVVV|/VVV___++++++++++     ',
      \'     +++|VVVVVVVVVV/##/ +_+_+_+_      ',
      \'       +|VVVVVVVVV___ +/#_#,#_#,\     ',
      \'        |VVVVVVV//##/+/#/+/#/''/#/    ',
      \'        |VVVVV/''+/#/+/#/+/#/ /#/     ',
      \'        |VVV/''++/#/+/#/ /#/ /#/      ',
      \'        ''V/''  /##//##//##//###/     ',
      \'                 ++                   ',
      \'                 ''                   ',
      \]

" Tcomment """"""""
let g:tcommentMaps = 0
nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>

"" Anzu """"""""""""""
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
let g:airline#extensions#anzu#enabled = 1

" YouCompleteMe """""""""""""""
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '❗'
let g:ycm_key_invoke_completion= '<leader>tc'
" let g:ycm_global_ycm_extra_conf = '~/.vim/'
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>ycm :YcmForceCompileAndDiagnostics<CR>
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^'],
\ }
let g:ycm_autoclose_preview_window_after_insertion = 1

" Switch """""""""""
let g:switch_mapping = '<leader>-'
let g:switch_custom_definitions =
      \[
      \ ['read', 'write'],
      \ ['Read', 'Write'],
      \ ['left', 'right'],
      \ ['Left', 'Right'],
      \ ['on', 'off'],
      \ ['On', 'Off'],
      \ ['up', 'down'],
      \ ['Up', 'Down'],
      \ ['in', 'out'],
      \ ['In', 'Out'],
      \ ['x', 'y', 'z'],
      \ ['X', 'Y', 'Z'],
      \ ['pick', 'fixup', 'squash', 'reword', 'edit', 'exec']
      \]

" Undotree """"""""""""""""
let g:undotree_WindowLayout = 2
nnoremap <leader>u :UndotreeToggle<cr>

" Vim C++ Highlight  """""""""""""""""""""
let g:cpp_class_scope_highlight = 0
let g:cpp_experimental_template_highlight = 0

" TagBar """"""""""""""""""""""""""""""
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : './markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" Vim Move """""""""""""""""
let g:move_map_keys = 0
vmap <leader>mj <Plug>MoveBlockDown
nmap <leader>mj <Plug>MoveLineDown
vmap <leader>mk <Plug>MoveBlockUp
nmap <leader>mk <Plug>MoveLineUp

" Cpp enanched highlight """""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
