" Source all the plugin files again, this time loading their configuration.
for file in split(glob('~/.vim/vundle_plugins/*.vim'), '\n')
  exe 'source' file
endfor

" ----------------------------------------------
"  Plugins Configuration
" ----------------------------------------------

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
" Gitv """"""""""""""""""""""""
nnoremap <Leader>gv :Gitv<CR>

" GitGutter """"""""""""""""
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_modified = '≈'

"" Ctrl Space """"""""""""""""
let g:ctrlspace_use_tabline = 1
let g:ctrlspace_project_root_markers = []

"" Supertab """""""""""""""""""
let g:SuperTabClosePreviewOnPopupClose = 1

" AirLine """""""""""""""""""""""""""""""""""""
let g:airline_theme = 'jellybeans'
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
        \ ['   Recent Files'],
        \ 'files',
        \ ['   Bookmarks'],
        \ 'bookmarks',
        \ ]
let g:startify_bookmarks = [
            \'~/.vim/',
            \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ ]
let g:startify_files_number = 6
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
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^'],
\ }
let g:ycm_autoclose_preview_window_after_insertion = 1
""" Help all Close """"""""""""
nnoremap <leader>ch :HelpAllClose<CR>
"" Window Swap """"""
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> gx :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> gx :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> gx :call WindowSwap#EasyWindowSwap()<CR>
