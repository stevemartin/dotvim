# Funding Circle vim configuration

## Instructions

```bash
git clone http://github.com/FundingCircle/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim/ && git submodule init && git submodule update
```

## Custom Commands

**NB**: \<leader\> is defined as *,* (comma).

* **i**: goes from normal mode to insert mode.
* **ii**: goes to normal mode from insert mode.
* **<leader>cf**: copies the current file name into the clipboard
* **<leader>R**: pastes last contents of what was yanked regardless of what was deleted after
* **<ctrl>c**: (from visual mode) copies the highlighted text into the clipboard
* **<leader>v**: vertical split
* **<leader>h**: horizontal split
* **<ctrl>j/k/h/l**: moves to split in desired direction
* **<ctrl>p**: opens fuzzy file finder
* **<leader>nt**: toggles nerdtree
* **<leader>pt**: toggles paste for better clipboard paste formatting
    * Use this before and after pasting formatted code into the current buffer

## Bundles

* [ack](https://github.com/mileszs/ack.vim) lets you shell out to ack within vim using `:Ack pattern [directory]`.  By default, results show up in the quickfix window.  You can use `:AckAdd` to append to the quickfix window or prefix 'Ack' with an 'L' to use the location list (just like `:grep`'s siblings).
* [ag](https://github.com/epmatsw/ag.vim) is the above but for ag ([a faster ack replacement](https://github.com/ggreer/the_silver_searcher))
* [auto-save](https://github.com/vim-scripts/vim-auto-save) Save the buffer after input like RubyMine.
* [ctrlp](https://github.com/kien/ctrlp.vim) is a fuzzy file finder invoked by hitting Ctrl-P in normal mode and typing some part of the file name you'd like to open.  This config also has `,f` mapped to the same function.
* [vim-fugitive](https://github.com/tpope/vim-fugitive) puts git into vim.  It can do almost everything git related, some of the most useful features are:
    * `:Gblame` to blame the current file.  Press enter on a commit to see the full commit.  Do `:Gedit` to go back to the current version (or just open it again).
    * `:Gread` to check out the current file from git.  Very useful if you made some experimental changes that you want to get rid of.
    * `:Gbrowse` to open the current file on GitHub, useful for sending links to other people.
* [jasmine](https://github.com/claco/jasmine.vim.git) Jasmine plugin for Vim
* [kwbd](https://github.com/rgarver/Kwbd.vim.git) Add a buffer close to vim that doesn't close the window
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter) lets you comment and uncomment things.  The most useful command is `,/` which comments or uncomments either the current line or the currently selected block.  This config has `,/` mapped to the Toggle instead of `,c` as listed in the docs (the rest of the commands use the `c` as listed).
* [nerdtree](https://github.com/scrooloose/nerdtree) puts a directory tree on the left side of the screen.  Press `\` to open it at your project root, or `Shift-\` to open it with the current file selected.  You can press `m` to move, delete, or create files.  Press `?` inside the tree to get more help.
    * **I**: Shows/Hides hidden files
* [vim-rails](https://github.com/tpope/vim-rails) lets `gf` and `:Rextract` work on partials, highlights Rails functions.
* [rspec](https://github.com/thoughtbot/vim-rspec.git) Run Rspec spec from Vim
* [ruby-matchit](https://github.com/vim-scripts/ruby-matchit.git) 'Matchit' for Ruby.
* [supertab](https://github.com/ervandew/supertab) lets you press Tab after Ctrl-P or Ctrl-N to cycle through completion options.
* [vim-surround](https://github.com/tpope/vim-surround) helps add/remove/change surround parentheses, quotes, and XML tags.  Inside of `"yolokitten"`, type `cs"'` to switch the surround double quotes to single quotes.  `t` can generally be used to refer to XML tags, so inside of `<tag>Hello</tag>` you can do `cit` to modify the word "Hello."  To add quotes around something, you can use the command `ys` followed by a motion and the character to surround it with.  For instance, inside of "hello", typing `ysiw(` will change it to "( hello )".
* [syntastic](https://github.com/scrooloose/syntastic) runs your compiler or interpreter and displays syntax errors in vim.  A `>>` in the gutter means there is an error on that line, you can mouse over it for more details.
* [ZoomWin](http://www.vim.org/scripts/script.php?script_id=508) lets you close all other windows with `<C-w>o`.  You can restore all the closed windows with the same command.  Useful with `:tabo` to close everything but what you're working on.


