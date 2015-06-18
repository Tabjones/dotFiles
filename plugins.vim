" Source all the plugin files again, this time loading their configuration.
for file in split(glob('~/.vim/vundle_plugins/*.vim'), '\n')
  exe 'source' file
endfor

"Ag vim """""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>as :AgFromSearch<CR>
"Search inside files
nnoremap <leader>ag :Ag<space>
"Search inside files currently open
nnoremap <leader>ab :AgBuffer<space>
"Search for file names
nnoremap <leader>af :AgFile<space>

"Ctrl-P """"""""""""""""""""""""""""""""""""""
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
" Fix fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
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
"
"Fugitive """""""""""""""""""""""""""""""""""""
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gca :Gcommit -a -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1

" AirLine """""""""""""""""""""""""""""""""""""
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_inactive_collapse = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_exclude_preview = 1

" NerdTree """"""""""""""""
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
" Close Vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
  \&& b:NERDTreeType == "primary") | q | endif

" UltiSnips """""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=["UltiSnips","CustomUltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Tabularize """""""""""""""""""""""""
nnoremap <Leader>t= :Tabularize assignment<CR>
vnoremap <Leader>t= :Tabularize assignment<CR>
nnoremap <Leader>t: :Tabularize symbol<CR>
vnoremap <Leader>t: :Tabularize symbol<CR>
nnoremap <Leader>t, :Tabularize comma<CR>
vnoremap <Leader>t, :Tabularize comma<CR>

" Gist """""""""""""""""""""
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" Uninpaired """""""""""""""""
" Remap ugly ][ to >< for non US keyboard
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

"Startify """"""""""""""""""""
let g:startify_list_order = [
        \ ['   Last Modified whitin this directory'],
        \ 'dir',
        \ ['   Recent Files'],
        \ 'files',
        \ ['   Sessions'],
        \ 'sessions',
        \ ['   Bookmarks'],
        \ 'bookmarks'
        \ ]
let g:startify_bookmarks = [
            \ '~/.vim/vimrc',
            \ '~/.vim/plugins.vim',
            \ '~/.vim/mappings.vim'
            \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ ]
let g:startify_files_number = 6
let g:startify_custom_indices = ['a', 'd', 'f', 'g', 'h']
let g:startify_change_to_dir = 0

hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=203
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
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
let g:startify_custom_header =
      \ map(split(system('fortune | cowsay -f eyes'), '\n'), '"   ". v:val') + ['','']

" Tcomment """"""""
let g:tcommentMaps = 0
nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>
nnoremap <silent><leader>cb :TCommentBlock<CR>
vnoremap <silent><leader>cb :TCommentBlock<CR>
"" Anzu """"""""""""""
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap # <Plug>(anzu-sharp)
let g:airline#extensions#anzu#enabled = 1
"ListToggle """""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
"QFEEnter """"""""""
let g:qfenter_vopen_map = ['<Space>', '<2-LeftMouse>']
" Voogle """"
let g:voogle_map="<leader>gg"
" YouCompleteMe """""""""""""""
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '❗'
let g:ycm_global_ycm_extra_conf = '~/.vim/'
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command = 'vertical-split'
""" Help all Close """"""""""""
nnoremap <leader>ch :HelpAllClose<CR>
"" Window Swap """"""
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> gx :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> gx :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> gx :call WindowSwap#EasyWindowSwap()<CR>
