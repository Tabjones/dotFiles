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
+ *(Optional)* _Melt your brain with your new GodMode Vim!_

## Plugin Requirements

A list of plugins that requires additional configuration, all of them should already be fulfilled if you followed the installation steps (or the script).

* [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be
  installed.
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
| 825 ★ |[delimitMate](https://github.com/Raimondi/delimitMate)|Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc. |
| 541 ★ |[vim-ctrlspace](https://github.com/szw/vim-ctrlspace)|Vim Workspace Controller |
| 524 ★ |[gitv](https://github.com/gregsexton/gitv)|gitk for Vim. |
| 366 ★ |[vim-eunuch](https://github.com/tpope/vim-eunuch)|eunuch.vim: helpers for UNIX |
| 88 ★ |[vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search)|Start a * or # search from a visual block |
| 36 ★ |[Join](https://github.com/sk1418/Join)|a better (hopefully) :Join command in vim |
| 31 ★ |[vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor) [:page_facing_up:](vundle_plugins/vim-togglecursor.vim)|Toggle the cursor shape in the terminal for Vim. |
| 30 ★ |[ListToggle](https://github.com/Valloric/ListToggle)|A vim plugin for toggling the display of the quickfix list and the location-list. |
|  ★ |[ctrlp.vim](https://github.com/kien/ctrlp.vim)|Problem fetching kien/ctrlp.vim. |
|  ★ |[vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)|Problem fetching octol/vim-cpp-enhanced-highlight. |
|  ★ |[undotree](https://github.com/mbbill/undotree)|Problem fetching mbbill/undotree. |
|  ★ |[MatchTagAlways](https://github.com/Valloric/MatchTagAlways) [:page_facing_up:](vundle_plugins/MatchTagAlways.vim)|Problem fetching Valloric/MatchTagAlways. |
|  ★ |[ultisnips](https://github.com/SirVer/ultisnips)|Problem fetching SirVer/ultisnips. |
|  ★ |[vim-markdown](https://github.com/gabrielelana/vim-markdown)|Problem fetching gabrielelana/vim-markdown. |
|  ★ |[vim-snippets](https://github.com/honza/vim-snippets)|Problem fetching honza/vim-snippets. |
|  ★ |[vim-unimpaired](https://github.com/tpope/vim-unimpaired)|Problem fetching tpope/vim-unimpaired. |
|  ★ |[vim-voogle](https://github.com/papanikge/vim-voogle)|Problem fetching papanikge/vim-voogle. |
|  ★ |[tabular](https://github.com/godlygeek/tabular)|Problem fetching godlygeek/tabular. |
|  ★ |[vim-endwise](https://github.com/tpope/vim-endwise)|Problem fetching tpope/vim-endwise. |
|  ★ |[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)|Problem fetching Valloric/YouCompleteMe. |
|  ★ |[vim-misc](https://github.com/xolox/vim-misc)|Problem fetching xolox/vim-misc. |
|  ★ |[jellybeans.vim](https://github.com/nanotech/jellybeans.vim) [:page_facing_up:](vundle_plugins/jellybeans.vim)|Problem fetching nanotech/jellybeans.vim. |
|  ★ |[vim-startify](https://github.com/mhinz/vim-startify)|Problem fetching mhinz/vim-startify. |
|  ★ |[vim-anzu](https://github.com/osyo-manga/vim-anzu)|Problem fetching osyo-manga/vim-anzu. |
|  ★ |[csv.vim](https://github.com/chrisbra/csv.vim)|Problem fetching chrisbra/csv.vim. |
|  ★ |[vim-abolish](https://github.com/tpope/vim-abolish)|Problem fetching tpope/vim-abolish. |
|  ★ |[vim-repeat](https://github.com/tpope/vim-repeat)|Problem fetching tpope/vim-repeat. |
|  ★ |[QFEnter](https://github.com/yssl/QFEnter)|Problem fetching yssl/QFEnter. |
|  ★ |[webapi-vim](https://github.com/mattn/webapi-vim)|Problem fetching mattn/webapi-vim. |
|  ★ |[tcomment_vim](https://github.com/tomtom/tcomment_vim)|Problem fetching tomtom/tcomment_vim. |
|  ★ |[vim-surround](https://github.com/tpope/vim-surround)|Problem fetching tpope/vim-surround. |
|  ★ |[vim-airline](https://github.com/bling/vim-airline)|Problem fetching bling/vim-airline. |
|  ★ |[matchit.zip](https://github.com/vim-scripts/matchit.zip)|Problem fetching vim-scripts/matchit.zip. |
|  ★ |[supertab](https://github.com/ervandew/supertab)|Problem fetching ervandew/supertab. |
|  ★ |[vim-move](https://github.com/matze/vim-move)|Problem fetching matze/vim-move. |
|  ★ |[vim-ros](https://github.com/taketwo/vim-ros)|Problem fetching taketwo/vim-ros. |
|  ★ |[gist-vim](https://github.com/mattn/gist-vim)|Problem fetching mattn/gist-vim. |
|  ★ |[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)|Problem fetching Xuyuanp/nerdtree-git-plugin. |
|  ★ |[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) [:page_facing_up:](vundle_plugins/vim-indent-guides.vim)|Problem fetching nathanaelkane/vim-indent-guides. |
|  ★ |[L9](https://github.com/vim-scripts/L9)|Problem fetching vim-scripts/L9. |
|  ★ |[vim-autoreadwatch](https://github.com/mutewinter/vim-autoreadwatch)|Problem fetching mutewinter/vim-autoreadwatch. |
|  ★ |[vim-gitgutter](https://github.com/airblade/vim-gitgutter)|Problem fetching airblade/vim-gitgutter. |
|  ★ |[nerdtree](https://github.com/scrooloose/nerdtree)|Problem fetching scrooloose/nerdtree. |
|  ★ |[vim-fugitive](https://github.com/tpope/vim-fugitive) [:page_facing_up:](vundle_plugins/vim-fugitive.vim)|Problem fetching tpope/vim-fugitive. |
|  ★ |[vim-windowswap](https://github.com/wesQ3/vim-windowswap)|Problem fetching wesQ3/vim-windowswap. |
|  ★ |[HelpClose](https://github.com/vim-scripts/HelpClose)|Problem fetching vim-scripts/HelpClose. |
|  ★ |[switch.vim](https://github.com/AndrewRadev/switch.vim)|Problem fetching AndrewRadev/switch.vim. |
| 786 ★ |[ag.vim](https://github.com/rking/ag.vim)|Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack' |
| 144 ★ |[ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher)|CtrlP C matching extension |
| 89 ★ |[colorv.vim](https://github.com/Rykka/colorv.vim) [:page_facing_up:](vundle_plugins/colorv.vim)|A powerful color tool in vim |

_That's 50 plugins, holy crap._

_Generated by `rake update_readme` on 2015/07/03._

