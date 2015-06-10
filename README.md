---
# The _GodMode_ dotVim Configuration
---
Based on the [Mutewinter's Vim Configuration of Champions](https://github.com/mutewinter/dot_vim) with modified plugins to enhance C/C++ programming and modified bindings to suit my liking.

## Enabling GodMode in Vim (a.k.a. Installation)
Assuming no Vim is installed, perform the following steps:
```  
git clone --recursive git@bitbucket.org:Tabjones/dotvim.git ~/.vim  
cd ~/.vim  
```
**Note:** Make sure you backup your old dotVim directory if it already exists.

---

Now you can be lazy or meticulous.
 
**To be lazy** just run the automated script (tested with Ubuntu 14.04).

+ Run `scripts/setup`

**Or to be meticulous** perform the following steps.

+ Install [NeoVim](https://github.com/neovim/neovim). For Ubuntu this resolves to    
```  
    sudo add-apt-repository ppa:neovim-ppa/unstable  
    sudo apt-get update  
    sudo apt-get install neovim  
```
```
    sudo apt-get install python-dev python-pip python3-dev python3-pip  
    sudo pip install neovim  
    sudo pip3 install neovim  
```
```
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60  
    sudo update-alternatives --config vi  
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60  
    sudo update-alternatives --config vim  
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60  
    sudo update-alternatives --config editor  
```
+ Make the `.vimrc` and `.nvimrc` symbolic links.  
```
    rake vim:link
```
+ Install [Vundle](https://github.com/gmarik/vundle) and all Vim plugins  
```
    git clone http://github.com/gmarik/vundle.git bundle/vundle  
    vim +PluginInstall +qall  
```
+ Install the [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) for Ag plugin
```
    sudo apt-get install silversearcher-ag
```
+ Install custom fonts for Airline, provided into fonts submodule
```
    cd fonts  
    ./install.sh  
    cd ~/.vim  
```
+ Compile CtrlP C Matching extension
```
    cd ~/.vim/bundle/ctrlp-cmatcher  
    ./install.sh  
    cd ~/.vim  
```

+ *(Optional)* _Melt your brain with your new GodMode Vim!_

## Plugin Requirements

A list of plugins that requires additional configuration, all of them should already be fulfilled if you followed the installation steps (or the script).

* [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be
  installed.
* [syntastic](https://github.com/scrooloose/syntastic) Requires many different
  binaries installed depending on what filetypes you want it to check. See the
  [FAQ](https://github.com/scrooloose/syntastic#faq) for more information.
* [Ag.vim](https://github.com/rking/ag.vim) Requires
  [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to be
  installed.
* [The custom font for vim-airline](https://github.com/powerline/fonts) requires manual installation. They are located into fonts directory.
* [CtrlP C Matching Extension](https://github.com/JazzCore/ctrlp-cmatcher)
  requires compilation. See the steps [in its
  readme](https://github.com/JazzCore/ctrlp-cmatcher).

## Mappings

* Typing `jk` insert mode is equivalent to `Escape`.
* Pressing `enter` in normal mode saves the current buffer.

And many more. See [`mappings.vim`](mappings.vim) and
[`vundle_plugins`](vundle_plugins) for more.

## Installing Custom Plugins

Create a new `.vim` file with the same name as the plugin you'd like to install
in [`vundle_plugins/`](vundle_plugins/). Then add the installation
block. For example:

`vundle_plugins/vim-move.vim`

```viml
if exists('g:vundle_installing_plugins')
  Plugin 'matze/vim-move.vim'
  finish
endif
```
Then run `vim +PluginUpdate`. This example installs [`vim-move`](https://github.com/matze/vim-move).

## Plugin List

| Stars___ | **Plugin** | **Description** |
| -------: | :--------- | :-------------- |
|  ★ |[vim-voogle](https://github.com/papanikge/vim-voogle) [:page_facing_up:](vundle_plugins/vim-voogle.vim)|Problem fetching papanikge/vim-voogle. |
| 2,891 ★ |[vim-rails](https://github.com/tpope/vim-rails) [:page_facing_up:](vundle_plugins/vim-rails.vim)|rails.vim: Ruby on Rails power tools |
| 2,772 ★ |[vim-surround](https://github.com/tpope/vim-surround) [:page_facing_up:](vundle_plugins/vim-surround.vim)|surround.vim: quoting/parenthesizing made simple |
| 951 ★ |[vimux](https://github.com/benmills/vimux) [:page_facing_up:](vundle_plugins/vimux.vim)|vim plugin to interact with tmux |
| 871 ★ |[vim-unimpaired](https://github.com/tpope/vim-unimpaired)|unimpaired.vim: pairs of handy bracket mappings |
| 791 ★ |[vim-startify](https://github.com/mhinz/vim-startify) [:page_facing_up:](vundle_plugins/vim-startify.vim)|:rocket: A fancy start screen for Vim. |
| 705 ★ |[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) [:page_facing_up:](vundle_plugins/vim-tmux-navigator.vim)|Seamless navigation between tmux panes and vim splits |
| 666 ★ |[vim-signify](https://github.com/mhinz/vim-signify) [:page_facing_up:](vundle_plugins/vim-signify.vim)|:rotating_light: Show a diff via Vim sign column. |
| 632 ★ |[vim-repeat](https://github.com/tpope/vim-repeat)|repeat.vim: enable repeating supported plugin maps with "." |
| 348 ★ |[vim-textobj-user](https://github.com/kana/vim-textobj-user)|Vim plugin: Create your own text objects |
| 275 ★ |[webapi-vim](https://github.com/mattn/webapi-vim)|vim interface to Web API |
| 217 ★ |[vim-stylus](https://github.com/wavded/vim-stylus)|Syntax Highlighting for Stylus |
| 165 ★ |[vim-rake](https://github.com/tpope/vim-rake)|rake.vim: it's like rails.vim without the rails |
| 158 ★ |[vim-markdown](https://github.com/gabrielelana/vim-markdown)|Markdown for Vim: a complete environment to create Markdown files with a syntax highlight that don't sucks! |
| 157 ★ |[vim-turbux](https://github.com/jgdavey/vim-turbux) [:page_facing_up:](vundle_plugins/vim-turbux.vim)|Turbo Ruby testing with tmux |
| 130 ★ |[vim-misc](https://github.com/xolox/vim-misc)|Miscellaneous auto-load Vim scripts |
| 94 ★ |[ZoomWin](https://github.com/vim-scripts/ZoomWin) [:page_facing_up:](vundle_plugins/ZoomWin.vim)|Zoom in/out  of windows (toggle between one window and multi-window) |
| 87 ★ |[vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search)|Start a * or # search from a visual block |
| 63 ★ |[vim-marked](https://github.com/itspriddle/vim-marked)|Open the current Markdown buffer in Marked.app |
| 30 ★ |[vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor) [:page_facing_up:](vundle_plugins/vim-togglecursor.vim)|Toggle the cursor shape in the terminal for Vim. |
| 8 ★ |[vim-tomdoc](https://github.com/jc00ke/vim-tomdoc)|Simple vim plugin that adds TomDoc templates to your code. |
| 3 ★ |[YouCompleteMe](https://github.com/blueyed/YouCompleteMe) [:page_facing_up:](vundle_plugins/YouCompleteMe.vim)|A slightly modified fork of YCM: A code-completion engine for Vim |
| 0 ★ |[vim-tmux](https://github.com/mutewinter/vim-tmux)|http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/examples/tmux.vim?view=log |
|  ★ |[vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock)|Problem fetching nelstrom/vim-textobj-rubyblock. |
|  ★ |[ListToggle](https://github.com/Valloric/ListToggle) [:page_facing_up:](vundle_plugins/ListToggle.vim)|Problem fetching Valloric/ListToggle. |
|  ★ |[nerdtree](https://github.com/scrooloose/nerdtree)|Problem fetching scrooloose/nerdtree. |
|  ★ |[vim-ruby-refactoring](https://github.com/ecomba/vim-ruby-refactoring)|Problem fetching ecomba/vim-ruby-refactoring. |
|  ★ |[vim-ruby](https://github.com/vim-ruby/vim-ruby)|Problem fetching vim-ruby/vim-ruby. |
|  ★ |[portkey](https://github.com/dsawardekar/portkey) [:page_facing_up:](vundle_plugins/portkey.vim)|Problem fetching dsawardekar/portkey. |
|  ★ |[scratch.vim](https://github.com/vim-scripts/scratch.vim)|Problem fetching vim-scripts/scratch.vim. |
|  ★ |[delimitMate](https://github.com/Raimondi/delimitMate)|Problem fetching Raimondi/delimitMate. |
|  ★ |[MatchTagAlways](https://github.com/Valloric/MatchTagAlways) [:page_facing_up:](vundle_plugins/MatchTagAlways.vim)|Problem fetching Valloric/MatchTagAlways. |
|  ★ |[syntastic](https://github.com/scrooloose/syntastic)|Problem fetching scrooloose/syntastic. |
|  ★ |[vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)|Problem fetching hail2u/vim-css3-syntax. |
|  ★ |[jellybeans.vim](https://github.com/nanotech/jellybeans.vim) [:page_facing_up:](vundle_plugins/jellybeans.vim)|Problem fetching nanotech/jellybeans.vim. |
|  ★ |[vim-handlebars](https://github.com/nono/vim-handlebars)|Problem fetching nono/vim-handlebars. |
|  ★ |[ultisnips](https://github.com/SirVer/ultisnips) [:page_facing_up:](vundle_plugins/ultisnips.vim)|Problem fetching SirVer/ultisnips. |
|  ★ |[switch.vim](https://github.com/AndrewRadev/switch.vim) [:page_facing_up:](vundle_plugins/switch.vim)|Problem fetching AndrewRadev/switch.vim. |
|  ★ |[vim-session](https://github.com/xolox/vim-session) [:page_facing_up:](vundle_plugins/vim-session.vim)|Problem fetching xolox/vim-session. |
|  ★ |[vim-jade](https://github.com/digitaltoad/vim-jade)|Problem fetching digitaltoad/vim-jade. |
|  ★ |[ember.vim](https://github.com/dsawardekar/ember.vim) [:page_facing_up:](vundle_plugins/ember.vim)|Problem fetching dsawardekar/ember.vim. |
|  ★ |[vim-less](https://github.com/groenewege/vim-less)|Problem fetching groenewege/vim-less. |
| 5,579 ★ |[vim-fugitive](https://github.com/tpope/vim-fugitive) [:page_facing_up:](vundle_plugins/vim-fugitive.vim)|fugitive.vim: a Git wrapper so awesome, it should be illegal |
| 5,242 ★ |[vim-airline](https://github.com/bling/vim-airline)|lean & mean status/tabline for vim that's light as air |
| 1,580 ★ |[vim-coffee-script](https://github.com/kchmck/vim-coffee-script)|CoffeeScript support for vim |
| 1,443 ★ |[supertab](https://github.com/ervandew/supertab)|Perform all your vim insert mode completions with Tab |
| 1,182 ★ |[vim-javascript](https://github.com/pangloss/vim-javascript)|Vastly improved Javascript indentation and syntax support in Vim. |
| 1,166 ★ |[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) [:page_facing_up:](vundle_plugins/vim-indent-guides.vim)|A Vim plugin for visually displaying indent levels in code |
| 1,065 ★ |[tabular](https://github.com/godlygeek/tabular) [:page_facing_up:](vundle_plugins/tabular.vim)|Vim script for text filtering and alignment |
| 572 ★ |[vim-abolish](https://github.com/tpope/vim-abolish)|abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word |
| 555 ★ |[html5.vim](https://github.com/othree/html5.vim)|HTML5 omnicomplete and syntax |
| 519 ★ |[vim-haml](https://github.com/tpope/vim-haml)|Vim runtime files for Haml, Sass, and SCSS |
| 484 ★ |[tcomment_vim](https://github.com/tomtom/tcomment_vim) [:page_facing_up:](vundle_plugins/tcomment_vim.vim)|An extensible & universal comment vim-plugin that also handles embedded filetypes |
| 428 ★ |[vim-json](https://github.com/elzr/vim-json)|A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly. |
| 400 ★ |[vim-endwise](https://github.com/tpope/vim-endwise)|endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc |
| 360 ★ |[vim-eunuch](https://github.com/tpope/vim-eunuch)|eunuch.vim: helpers for UNIX |
| 308 ★ |[undotree](https://github.com/mbbill/undotree)|The ultimate undo history visualizer for VIM |
| 277 ★ |[vim-cucumber](https://github.com/tpope/vim-cucumber)|Vim Cucumber runtime files |
| 235 ★ |[vim-bundler](https://github.com/tpope/vim-bundler)|bundler.vim: Lightweight support for Ruby's Bundler |
| 90 ★ |[matchit.zip](https://github.com/vim-scripts/matchit.zip)|extended % matching for HTML, LaTeX, and many other languages |
| 75 ★ |[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)|A plugin of NERDTree showing git status |
| 55 ★ |[vim-anzu](https://github.com/osyo-manga/vim-anzu) [:page_facing_up:](vundle_plugins/vim-anzu.vim)|Vim search status. |
| 51 ★ |[L9](https://github.com/vim-scripts/L9)|Vim-script library |
| 44 ★ |[textile.vim](https://github.com/timcharper/textile.vim)|Textile for VIM |
| 35 ★ |[Join](https://github.com/sk1418/Join)|a better (hopefully) :Join command in vim |
| 26 ★ |[QFEnter](https://github.com/yssl/QFEnter) [:page_facing_up:](vundle_plugins/QFEnter.vim)|Open a Quickfix item in a window you choose. (Vim plugin) |
| 7 ★ |[indenthtml.vim](https://github.com/vim-scripts/indenthtml.vim) [:page_facing_up:](vundle_plugins/indenthtml.vim)|alternative html indent script |
| 7 ★ |[nginx.vim](https://github.com/mutewinter/nginx.vim)|Syntax highlighting for nginx.conf and related config files. |
| 3 ★ |[swap-parameters](https://github.com/mutewinter/swap-parameters)|Swap parameters of a function or a comma separated list with a single command. |
| 2 ★ |[taskpaper.vim](https://github.com/mutewinter/taskpaper.vim)|This package contains a syntax file and a file-type plugin for the simple format used by the TaskPaper application. |
| 1 ★ |[tomdoc.vim](https://github.com/mutewinter/tomdoc.vim)|A simple syntax add-on for vim that highlights your TomDoc comments. |
| 0 ★ |[vim-autoreadwatch](https://github.com/mutewinter/vim-autoreadwatch)|A forked script for vim auto reloading of buffers when changed on disk. |
|  ★ |[HelpClose](https://github.com/vim-scripts/HelpClose)|Problem fetching vim-scripts/HelpClose. |
| 4,422 ★ |[ctrlp.vim](https://github.com/kien/ctrlp.vim)|Fuzzy file, buffer, mru, tag, etc finder. |
| 2,547 ★ |[emmet-vim](https://github.com/mattn/emmet-vim)|emmet for vim: http://emmet.io/ |
| 1,052 ★ |[gist-vim](https://github.com/mattn/gist-vim) [:page_facing_up:](vundle_plugins/gist-vim.vim)|vimscript for gist |
| 760 ★ |[ag.vim](https://github.com/rking/ag.vim)|Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack' |
| 200 ★ |[csv.vim](https://github.com/chrisbra/csv.vim)|A Filetype plugin for csv files |
| 140 ★ |[ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher)|CtrlP C matching extension |
| 89 ★ |[colorv.vim](https://github.com/Rykka/colorv.vim) [:page_facing_up:](vundle_plugins/colorv.vim)|A powerful color tool in vim |
| 3 ★ |[GIFL](https://github.com/mutewinter/GIFL) [:page_facing_up:](vundle_plugins/GIFL.vim)|Add "wrap terms in google I'm feeling lucky url" à la Textmate |

_That's 81 plugins, holy crap._

_Generated by `rake update_readme` on 2015/06/10._