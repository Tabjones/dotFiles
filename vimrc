delimitMate Report
==================

* Options: ( ) default, (g) global, (b) buffer

( ) delimitMate_apostrophes = ''
( ) delimitMate_apostrophes_list = []
( ) delimitMate_autoclose = 1
( ) delimitMate_balance_matchpairs = 0
( ) delimitMate_eol_marker = ''
( ) delimitMate_excluded_regions = 'Comment'
( ) delimitMate_excluded_regions_enabled = 1
( ) delimitMate_excluded_regions_list = ['Comment']
( ) delimitMate_expand_cr = 0
( ) delimitMate_expand_inside_quotes = 0
( ) delimitMate_expand_space = 0
( ) delimitMate_insert_eol_marker = 1
( ) delimitMate_jump_expansion = 0
( ) delimitMate_left_delims = ['(', '{', '[']
( ) delimitMate_matchpairs = '(:),{:},[:]'
( ) delimitMate_matchpairs_list = [['(', ')'], ['{', '}'], ['[', ']']]
( ) delimitMate_nesting_quotes = []
( ) delimitMate_quotes = '" '' `'
( ) delimitMate_quotes_list = ['"', '''', '`']
( ) delimitMate_right_delims = [')', '}', ']']
( ) delimitMate_smart_matchpairs = '^\%(\w\|\!\|[£$]\|[^[:punct:][:space:]]\)'
( ) delimitMate_smart_quotes = '\%(\w\|[^[:punct:][:space:]"''`]\|\%(\\\\\)*\\\)\%#\|\%#\%(\w\|[^[:space:][:punct:]"''`]\)'
( ) delimitMate_tab2exit = 1

( ) g:delimitMate_excluded_ft = ''
--------------------

* Mappings:

i  )            @<Plug>delimitMate)
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  }            @<Plug>delimitMate}
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  ]            @<Plug>delimitMate]
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  (            @<Plug>delimitMate(
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  {            @<Plug>delimitMate{
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  [            @<Plug>delimitMate[
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  "            @<Plug>delimitMate"
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  '            @<Plug>delimitMate'
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  `            @<Plug>delimitMate`
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  <BS>         @<Plug>delimitMateBS
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  <S-BS>       @<Plug>delimitMateS-BS
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
i  <S-Tab>     * pumvisible() ? "\<C-P>" : "\<S-Tab>"
	Last set from ~/.vim/bundle/YouCompleteMe/autoload/youcompleteme.vim
i  <C-G>g       @<Plug>delimitMateJumpMany
	Last set from ~/.vim/bundle/delimitMate/plugin/delimitMate.vim
--------------------

* Showcase:

Open: (|)
Delete: |
Exit: ()|

Open: {|}
Delete: |
Exit: {}|

Open: [|]
Delete: |
Exit: []|

Open: "|"
Delete: |
Exit: ""|

Open: '|'
Delete: |
Exit: ''|

Open: `|`
Delete: |
Exit: ``|

