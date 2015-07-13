" ----------------------------------------
" Mappings
" ----------------------------------------
" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

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
" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j
" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>
" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" ---------------
" Window Movement
" ---------------
nnoremap <silent> gh :wincmd h<CR>
nnoremap <silent> gj :wincmd j<CR>
nnoremap <silent> gk :wincmd k<CR>
nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> gl :wincmd l<CR>
" Previous Window
nnoremap <silent> gp :wincmd p<CR>
" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" New Tab
nnoremap <silent> <leader>te :tabnew<CR>
" Next Tab
nnoremap <silent> <leader>tn :tabn<CR>
" Prev Tab
nnoremap <silent> <leader>tp :tabp<CR>

" ---------------
" Insert Mode Mappings
" ---------------
" Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" ---------------
" Leader Mappings
" ---------------
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
map <leader>par {v}!par -jw100<CR>
vmap <leader>par !par -jw100<CR>

" ---------------
" Typo Fixes
" ---------------
noremap <F1> <Esc>
inoremap <F1> <Esc>
cnoremap w' w<CR>
" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@
" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k
" Insert date
" iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>
