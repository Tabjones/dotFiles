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
          \ endif

    " Fix trailing whitespace in my most used programming langauges
    autocmd BufWritePre *.cpp,*.h,*.hpp,*.c,Makefile,CMakeLists.txt,*.py,
          \*.coffee,*.rb,*.erb,*.md,*.scss,*.vim,Cakefile,*.hbs,*.launch,
          \*.msg,*.srv
          \ silent! :StripTrailingWhiteSpace

    " Leave the return key alone when in command line windows, since it's used
    " to run commands there.
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()

    " Resize splits when the window is resized
    " from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
    au VimResized * :wincmd =
  augroup END
endif
