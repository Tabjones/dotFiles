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
+ Compile [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) extensions, including C/C++
```
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
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
+ Install `exuberant ctags` for easytags plugin
```
    sudo apt-get install exuberant-ctags
```  
+ *(Optional)* _Melt your brain with your new GodMode Vim!_

## Plugin Requirements

A list of plugins that requires additional configuration, all of them should already be fulfilled if you followed the installation steps (or the script).

* [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be
  installed.
* [syntastic](https://github.com/scrooloose/syntastic) Requires many different
  binaries installed depending on what filetypes you want it to check. See the
  [FAQ](https://github.com/scrooloose/syntastic#faq) for more information.
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) Requires compilation.
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
[`plugins.vim`](plugins.vim) for more.

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

| **Stars** | **Plugin** | **Description** |
| --------: | :--------- | :-------------- |
| 7,743 ★ |[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)|A code-completion engine for Vim |
| 5,604 ★ |[vim-fugitive](https://github.com/tpope/vim-fugitive) [:page_facing_up:](vundle_plugins/vim-fugitive.vim)|fugitive.vim: a Git wrapper so awesome, it should be illegal |
| 5,289 ★ |[vim-airline](https://github.com/bling/vim-airline)|lean & mean status/tabline for vim that's light as air |
| 4,821 ★ |[nerdtree](https://github.com/scrooloose/nerdtree)|A tree explorer plugin for vim. |
| 4,446 ★ |[ctrlp.vim](https://github.com/kien/ctrlp.vim)|Fuzzy file, buffer, mru, tag, etc finder. |
| 2,959 ★ |[vim-gitgutter](https://github.com/airblade/vim-gitgutter)|A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks. |
| 2,795 ★ |[vim-surround](https://github.com/tpope/vim-surround)|surround.vim: quoting/parenthesizing made simple |
| 1,633 ★ |[ultisnips](https://github.com/SirVer/ultisnips)|UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips! |
| 1,369 ★ |[vim-snippets](https://github.com/honza/vim-snippets)|vim-snipmate default snippets (Previously snipmate-snippets) |
| 1,173 ★ |[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) [:page_facing_up:](vundle_plugins/vim-indent-guides.vim)|A Vim plugin for visually displaying indent levels in code |
| 1,067 ★ |[tabular](https://github.com/godlygeek/tabular)|Vim script for text filtering and alignment |
| 1,057 ★ |[gist-vim](https://github.com/mattn/gist-vim)|vimscript for gist |
| 878 ★ |[vim-unimpaired](https://github.com/tpope/vim-unimpaired)|unimpaired.vim: pairs of handy bracket mappings |
| 818 ★ |[delimitMate](https://github.com/Raimondi/delimitMate)|Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc. |
| 794 ★ |[vim-startify](https://github.com/mhinz/vim-startify)|:rocket: A fancy start screen for Vim. |
| 767 ★ |[ag.vim](https://github.com/rking/ag.vim)|Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack' |
| 752 ★ |[jellybeans.vim](https://github.com/nanotech/jellybeans.vim) [:page_facing_up:](vundle_plugins/jellybeans.vim)|A colorful, dark color scheme for Vim. |
| 635 ★ |[vim-repeat](https://github.com/tpope/vim-repeat)|repeat.vim: enable repeating supported plugin maps with "." |
| 580 ★ |[vim-abolish](https://github.com/tpope/vim-abolish)|abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word |
| 521 ★ |[gitv](https://github.com/gregsexton/gitv)|gitk for Vim. |
| 486 ★ |[tcomment_vim](https://github.com/tomtom/tcomment_vim)|An extensible & universal comment vim-plugin that also handles embedded filetypes |
| 403 ★ |[vim-endwise](https://github.com/tpope/vim-endwise)|endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc |
| 360 ★ |[vim-eunuch](https://github.com/tpope/vim-eunuch)|eunuch.vim: helpers for UNIX |
| 308 ★ |[undotree](https://github.com/mbbill/undotree)|The ultimate undo history visualizer for VIM |
| 275 ★ |[webapi-vim](https://github.com/mattn/webapi-vim)|vim interface to Web API |
| 205 ★ |[MatchTagAlways](https://github.com/Valloric/MatchTagAlways) [:page_facing_up:](vundle_plugins/MatchTagAlways.vim)|A Vim plugin that always highlights the enclosing html/xml tags |
| 203 ★ |[csv.vim](https://github.com/chrisbra/csv.vim)|A Filetype plugin for csv files |
| 197 ★ |[switch.vim](https://github.com/AndrewRadev/switch.vim) [:page_facing_up:](vundle_plugins/switch.vim)|A simple Vim plugin to switch segments of text with predefined replacements |
| 159 ★ |[vim-markdown](https://github.com/gabrielelana/vim-markdown)|Markdown for Vim: a complete environment to create Markdown files with a syntax highlight that don't sucks! |
| 141 ★ |[ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher)|CtrlP C matching extension |
| 130 ★ |[vim-misc](https://github.com/xolox/vim-misc)|Miscellaneous auto-load Vim scripts |
| 98 ★ |[vim-windowswap](https://github.com/wesQ3/vim-windowswap)|Swap your windows without ruining your layout |
| 91 ★ |[matchit.zip](https://github.com/vim-scripts/matchit.zip)|extended % matching for HTML, LaTeX, and many other languages |
| 89 ★ |[colorv.vim](https://github.com/Rykka/colorv.vim) [:page_facing_up:](vundle_plugins/colorv.vim)|A powerful color tool in vim |
| 88 ★ |[vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search)|Start a * or # search from a visual block |
| 85 ★ |[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)|A plugin of NERDTree showing git status |
| 56 ★ |[vim-anzu](https://github.com/osyo-manga/vim-anzu)|Vim search status. |
| 51 ★ |[L9](https://github.com/vim-scripts/L9)|Vim-script library |
| 36 ★ |[Join](https://github.com/sk1418/Join)|a better (hopefully) :Join command in vim |
| 30 ★ |[vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor) [:page_facing_up:](vundle_plugins/vim-togglecursor.vim)|Toggle the cursor shape in the terminal for Vim. |
| 29 ★ |[ListToggle](https://github.com/Valloric/ListToggle)|A vim plugin for toggling the display of the quickfix list and the location-list. |
| 26 ★ |[QFEnter](https://github.com/yssl/QFEnter)|Open a Quickfix item in a window you choose. (Vim plugin) |
| 16 ★ |[scratch.vim](https://github.com/vim-scripts/scratch.vim)|Plugin to create and use a scratch Vim buffer |
| 10 ★ |[vim-voogle](https://github.com/papanikge/vim-voogle)|google for the word under the cursor to a browser because 2013 |
| 1 ★ |[HelpClose](https://github.com/vim-scripts/HelpClose)|Close all help windows |
| 0 ★ |[vim-autoreadwatch](https://github.com/mutewinter/vim-autoreadwatch)|A forked script for vim auto reloading of buffers when changed on disk. |

_That's 46 plugins, holy crap._

_Generated by `rake update_readme` on 2015/06/18._

