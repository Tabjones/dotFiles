---
# The _GodMode_ dotVim Configuration
---
Based on the [Mutewinter's Vim Configuration of Champions](https://github.com/mutewinter/dot_vim) with modified plugins to enhance C/C++ programming and modified bindings to suit my liking!

Here's an example screen:
![VimScreen.png](https://bitbucket.org/repo/qeBxj8/images/2538623278-VimScreen.png)

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
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) Requires compilation. Also for C++ completion to work you need an extra configuration file, the one I'm using
  is included into ycm directory. To use it you also need cmake or catkin (if using ROS) to export compile commands (`cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1`). Additional information
  can be found on [YouCompleteMe Help Page](https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion-engine-usage).
* [Ag.vim](https://github.com/rking/ag.vim) Requires
  [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to be
  installed.
* [The custom font for vim-airline](https://github.com/powerline/fonts) requires manual installation. They are located into fonts directory.
* [CtrlP C Matching Extension](https://github.com/JazzCore/ctrlp-cmatcher)
  requires compilation. See the steps [in its
  readme](https://github.com/JazzCore/ctrlp-cmatcher).
* [Latex-Box](https://github.com/LaTeX-Box-Team/LaTeX-Box) and [Vim-Latex-Preview](https://github.com/xuhdev/vim-latex-live-preview) requires a LaTeX distribution and [latexmk](http://users.phys.psu.edu/~collins/software/latexmk-jcc/) to be installed. Normally, TexLive distribution should also provide latexmk.
* [Tagbar](https://github.com/majutsushi/tagbar) requires [exuberant-ctags](http://ctags.sourceforge.net/) to be installed, if you want tags for C/C++ code.

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
Then run `vim +PluginInstall +qall`. This example installs [vim-move](https://github.com/matze/vim-move).

## Plugin List

| **Stars** | **Plugin** | **Description** |
| --------: | :--------- | :-------------- |
| 7,933 ★ |[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)|A code-completion engine for Vim |
| 5,710 ★ |[vim-fugitive](https://github.com/tpope/vim-fugitive)|fugitive.vim: a Git wrapper so awesome, it should be illegal |
| 5,449 ★ |[vim-airline](https://github.com/bling/vim-airline)|lean & mean status/tabline for vim that's light as air |
| 4,918 ★ |[nerdtree](https://github.com/scrooloose/nerdtree)|A tree explorer plugin for vim. |
| 4,549 ★ |[ctrlp.vim](https://github.com/kien/ctrlp.vim)|Fuzzy file, buffer, mru, tag, etc finder. |
| 3,171 ★ |[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)|precision colorscheme for the vim text editor |
| 2,995 ★ |[vim-gitgutter](https://github.com/airblade/vim-gitgutter)|A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks. |
| 2,855 ★ |[vim-surround](https://github.com/tpope/vim-surround)|surround.vim: quoting/parenthesizing made simple |
| 1,882 ★ |[vim-easymotion](https://github.com/easymotion/vim-easymotion)|Vim motions on speed! |
| 1,848 ★ |[tagbar](https://github.com/majutsushi/tagbar)|Vim plugin that displays tags in a window, ordered by scope |
| 1,679 ★ |[ultisnips](https://github.com/SirVer/ultisnips)|UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips! |
| 1,469 ★ |[supertab](https://github.com/ervandew/supertab)|Perform all your vim insert mode completions with Tab |
| 1,401 ★ |[vim-snippets](https://github.com/honza/vim-snippets)|vim-snipmate default snippets (Previously snipmate-snippets) |
| 1,192 ★ |[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)|A Vim plugin for visually displaying indent levels in code |
| 1,088 ★ |[tabular](https://github.com/godlygeek/tabular)|Vim script for text filtering and alignment |
| 1,079 ★ |[gist-vim](https://github.com/mattn/gist-vim)|vimscript for gist |
| 895 ★ |[vim-unimpaired](https://github.com/tpope/vim-unimpaired)|unimpaired.vim: pairs of handy bracket mappings |
| 833 ★ |[delimitMate](https://github.com/Raimondi/delimitMate)|Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc. |
| 816 ★ |[vim-startify](https://github.com/mhinz/vim-startify)|A fancy start screen for Vim. |
| 804 ★ |[ag.vim](https://github.com/rking/ag.vim)|Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack' |
| 762 ★ |[jellybeans.vim](https://github.com/nanotech/jellybeans.vim)|A colorful, dark color scheme for Vim. |
| 648 ★ |[vim-repeat](https://github.com/tpope/vim-repeat)|repeat.vim: enable repeating supported plugin maps with "." |
| 594 ★ |[vim-abolish](https://github.com/tpope/vim-abolish)|abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word |
| 543 ★ |[vim-ctrlspace](https://github.com/szw/vim-ctrlspace)|Vim Workspace Controller |
| 526 ★ |[gitv](https://github.com/gregsexton/gitv)|gitk for Vim. |
| 500 ★ |[tcomment_vim](https://github.com/tomtom/tcomment_vim)|An extensible & universal comment vim-plugin that also handles embedded filetypes |
| 414 ★ |[vim-endwise](https://github.com/tpope/vim-endwise)|endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc |
| 370 ★ |[vim-eunuch](https://github.com/tpope/vim-eunuch)|eunuch.vim: helpers for UNIX |
| 316 ★ |[undotree](https://github.com/mbbill/undotree)|The ultimate undo history visualizer for VIM |
| 280 ★ |[webapi-vim](https://github.com/mattn/webapi-vim)|vim interface to Web API |
| 262 ★ |[LaTeX-Box](https://github.com/LaTeX-Box-Team/LaTeX-Box)|Lightweight Toolbox for LaTeX - New Official repository |
| 214 ★ |[MatchTagAlways](https://github.com/Valloric/MatchTagAlways)|A Vim plugin that always highlights the enclosing html/xml tags |
| 210 ★ |[csv.vim](https://github.com/chrisbra/csv.vim)|A Filetype plugin for csv files |
| 201 ★ |[switch.vim](https://github.com/AndrewRadev/switch.vim)|A simple Vim plugin to switch segments of text with predefined replacements |
| 168 ★ |[vim-markdown](https://github.com/gabrielelana/vim-markdown)|Markdown for Vim: a complete environment to create Markdown files with a syntax highlight that don't sucks! |
| 146 ★ |[ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher)|CtrlP C matching extension |
| 140 ★ |[vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)|Additional Vim syntax highlighting for C++ (including C++11/14) |
| 133 ★ |[vim-misc](https://github.com/xolox/vim-misc)|Miscellaneous auto-load Vim scripts |
| 116 ★ |[vim-move](https://github.com/matze/vim-move)|Plugin to move lines and selections up and down |
| 103 ★ |[vim-windowswap](https://github.com/wesQ3/vim-windowswap)|Swap your windows without ruining your layout |
| 103 ★ |[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)|A plugin of NERDTree showing git status |
| 91 ★ |[matchit.zip](https://github.com/vim-scripts/matchit.zip)|extended % matching for HTML, LaTeX, and many other languages |
| 89 ★ |[colorv.vim](https://github.com/Rykka/colorv.vim)|A powerful color tool in vim |
| 88 ★ |[vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search)|Start a * or # search from a visual block |
| 74 ★ |[vim-latex-live-preview](https://github.com/xuhdev/vim-latex-live-preview)|A Vim Plugin for Lively Previewing LaTeX PDF Output |
| 57 ★ |[vim-anzu](https://github.com/osyo-manga/vim-anzu)|Vim search status. |
| 51 ★ |[L9](https://github.com/vim-scripts/L9)|Vim-script library |
| 36 ★ |[Join](https://github.com/sk1418/Join)|a better (hopefully) :Join command in vim |
| 31 ★ |[vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor)|Toggle the cursor shape in the terminal for Vim. |
| 27 ★ |[QFEnter](https://github.com/yssl/QFEnter)|Open a Quickfix item in a window you choose. (Vim plugin) |
| 13 ★ |[vim-ros](https://github.com/taketwo/vim-ros)|Vim plugin for ROS development |
| 10 ★ |[vim-voogle](https://github.com/papanikge/vim-voogle)|google for the word under the cursor to a browser because 2013 |
| 2 ★ |[HelpClose](https://github.com/vim-scripts/HelpClose)|Close all help windows |
| 0 ★ |[vim-autoreadwatch](https://github.com/mutewinter/vim-autoreadwatch)|A forked script for vim auto reloading of buffers when changed on disk. |

_That's 54 plugins, OMG!_

_Generated by `rake update_readme` on 2015/07/14._