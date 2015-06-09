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
" status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
