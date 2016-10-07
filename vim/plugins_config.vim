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
"                                                          Plugins Configuration
" ------------------------------------------------------------------------------

" Jellybeans
set background=dark
colorscheme jellybeans

"Ctrl-P """"""""""""""""""""""""""""""""""""""
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
" Fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify\|netrw\|help\|quickfix'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
" Leader Commands
nnoremap <leader>cp :CtrlP<CR>
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " HatTip: http://robots.thoughtbot.com/faster-grepping-in-vim and
  " @ethanmuller
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
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

" Vinegar """"""""""""""""""
"  - open netrw for current file
"  .  start a command for current file,  ! same with prepended bang
"  ~  go home
"  cg cl    :cd :lcd

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
let g:startify_bookmarks = [
            \'~/.vim/',
            \'/mnt/e/Software Development/',
            \'/mnt/e/Software Development/ROBOmove/',
            \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ ]
let g:startify_files_number = 8
let g:startify_change_to_dir = 1
let g:startify_session_autoload = 0
let g:startify_enable_special  = 1
hi StartifyFooter  ctermfg=171
hi StartifyHeader  ctermfg=152
hi StartifySlash   ctermfg=224
hi StartifyNumber  ctermfg=26
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

nnoremap <leader>ss :SSave
nnoremap <leader>sl :SLoad
nnoremap <leader>sd :SDelete
nnoremap <leader>sc :SClose

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

" Cpp enanched highlight """""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" " FZF """""""""""""""""""""""""""""""""
" let g:fzf_layout = {}  "Never use tmux panes
" let g:fzf_buffers_jump = 1  "Jump to existing instead of opening new
" nnoremap <leader>f :Files<cr>
" nnoremap <leader>b :Buffers<cr>
" nnoremap <leader>c :Commits<cr>
" imap <leader>l  <plug>(fzf-complete-path)
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)
