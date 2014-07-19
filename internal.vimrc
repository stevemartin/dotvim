set nocompatible

execute pathogen#infect()
let mapleader = ","
color vividchalk
set guifont=monaco:h16
let &t_Co=256

set cursorline
set hidden
set number
set ruler
set encoding=utf-8
set backspace=indent,eol,start " Fix problems with backspace in insert mode
syntax on

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set laststatus=2 " Status bar
set showcmd " Display incomplete commands

" Turn off backup files
set noswapfile
set nobackup
set nowb

" Speed up
set ttyfast
set ttyscroll=3
set lazyredraw

set autoread " Reload files changed outside vim

set autowrite " Automatically :write before running commands

" Press i to enter insert mode, ii to go back to normal mode
imap ii <esc>

" Copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>

" Paste last contents of what was yanked regardless of what was deleted after
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Copy to clipboard
vnoremap <C-C> "*y

" Vertical split and move to new window
nnoremap <leader>v <C-W>v<C-W>l

" Horizontal split and move to new window
nnoremap <leader>h :split<CR><C-W>j

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Control-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*
map <leader>b :CtrlPBuffer<CR>
map <leader>cpc :CtrlPClearCache<CR>

" Make CtrlP use Ag for listing the files. Much faster and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" CtrlP auto cache clearing.
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" NERDTree configuration
nnoremap <silent> <C-\> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <leader>nt :NERDTreeToggle<CR>

" ZoomWin configuration
map <leader><leader> :ZoomWin<CR>

" Delete buffer without closing window
nnoremap <silent> <leader>bd :Kwbd<CR>

" enable AutoSave on Vim startup
let g:auto_save = 1

" CTags
map <leader>rt :!ctags --extra=+f --exclude=tmp --exclude=node_modules -R * <CR><CR>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
map <leader>M :set syntax=markdown<CR>:set wrap<CR>:set spell<CR>

" Load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" % to bounce from do to end etc.
runtime! macros/matchit.vim

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" Open up a git grep line, with a quote started for the search
nnoremap <leader>ag :Ag

" Toggle pasting to preserve format when pasting from clipboard into buffer
nnoremap <leader>pt :set invpaste paste?<cr>
set pastetoggle=<leader>pt
set showmode

" Run RSpec tests
let g:rspec_command = "!bundle exec rspec {spec}"
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>z :!rspec %<CR>

" Find the related spec for any file you open. Requires
"  * Your specs live in spec/ or fast_spec/
"  * Your pwd (current dir) is the project root
"  * You use the same dir structure in your code and specs so that
"    code living at lib/foo/bar.rb has a spec at spec/lib/foo/bar.rb
"
" This method handles files in fast_spec unlike the :A and :AV functions
" that ship with rails.vim
function! FindSpec()
  let s:fullpath = expand("%:p")
  let s:filepath = expand("%:h")
  let s:fname = expand("%:t")

  " Possible names for the spec/test for the file we're looking at
  let s:test_names = [substitute(s:fname, ".rb$", "_spec.rb", ""), substitute(s:fname, ".rb$", "_test.rb", "")]

  " Possible paths
  let s:test_paths = ["spec", "fast_spec", "test"]
  for test_name in s:test_names
    for path in s:test_paths
      let s:filepath_without_app = substitute(s:filepath, "app/", "", "")
      let s:spec_path = path . "/" . s:filepath_without_app . "/" . test_name
      let s:full_spec_path = substitute(s:fullpath, s:filepath . "/" . s:fname, s:spec_path, "")
      if filereadable(s:full_spec_path)
        execute ":botright vsp " . s:full_spec_path
        return
      endif
    endfor
  endfor
endfunction

map <leader>fs :call FindSpec()<CR>
