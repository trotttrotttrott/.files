runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

let $JS_CMD='node' " lintjs doesn't like Lion's js interpreter.

" Basics {
  colorscheme vividchalk
  set nocompatible " explicitly get out of vi-compatible mode
  set noexrc " don't use local version of .(g)vimrc, .exrc
  set background=dark " we plan to use a dark background
  set cpoptions=aABceFsmq
  "             |||||||||
  "             ||||||||+-- When joining lines, leave the cursor
  "             |||||||    between joined lines
  "             |||||||+-- When a new match is created (showmatch)
  "             ||||||    pause for .5
  "             ||||||+-- Set buffer options when entering the
  "             |||||    buffer
  "             |||||+-- :write command updates current file name
  "             ||||+-- Automatically add <CR> to the last line
  "             |||    when using :@r
  "             |||+-- Searching continues at the end of the match
  "             ||    at the cursor position
  "             ||+-- A backslash has no special meaning in mappings
  "             |+-- :write updates alternative file name
  "             +-- :read updates alternative file name
  syntax on " syntax highlighting on
" }

" General {
  filetype plugin indent on " load filetype plugins/indent settings
  set autochdir " always switch to the current file directory
  set backspace=indent,eol,start " make backspace a more flexible
  set backup " make backup files
  set backupdir=~/.vim/backup " where to put backup files
  set directory=~/.vim/tmp " directory to place swap files in
  set clipboard=unnamed " share clipboard
  set fileformats=unix,dos,mac " support all three, in this order
  set hidden " you can change buffers without saving
  set noerrorbells " don't make noise
  set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
  "             | | | | | | | | |
  "             | | | | | | | | +-- "]" Insert and Replace
  "             | | | | | | | +-- "[" Insert and Replace
  "             | | | | | | +-- "~" Normal
  "             | | | | | +-- <Right> Normal and Visual
  "             | | | | +-- <Left> Normal and Visual
  "             | | | +-- "l" Normal and Visual (not recommended)
  "             | | +-- "h" Normal and Visual (not recommended)
  "             | +-- <Space> Normal and Visual
  "             +-- <BS> Normal and Visual
  set wildmenu " turn on command line completion wild style
  set wildmode=list:longest " turn on wild mode huge list
" }

" Vim UI {
  set cursorline " highlight current line
  set incsearch " BUT do highlight as you type you
           " search phrase
  set laststatus=2 " always show the status line
  set lazyredraw " do not redraw while running macros
  set linespace=0 " don't insert any extra pixel lines
           " betweens rows
  set list " we do what to show tabs, to ensure we get them
        " out of my files
  set listchars=tab:>-,trail:- " show tabs and trailing
  set matchtime=5 " how many tenths of a second to blink
           " matching brackets for
  set nohlsearch " do not highlight searched for phrases
  set nostartofline " leave my cursor where it was
  set novisualbell " don't blink
  set number " turn on line numbers
  set numberwidth=5 " We are good up to 99999 lines
  set report=0 " tell us when anything is changed via :...
  set ruler " Always show current positions along the bottom
  set shortmess=aOstT " shortens messages to avoid
             " 'press a key' prompt
  set showcmd " show the command being typed
  set showmatch " show matching brackets
  set sidescrolloff=10 " Keep 5 lines at the size
  set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  "              | | | | |  |   |    |  |   |  |
  "              | | | | |  |   |    |  |   |  + current
  "              | | | | |  |   |    |  |   |     column
  "              | | | | |  |   |    |  |   +-- current line
  "              | | | | |  |   |    |  +-- current % into file
  "              | | | | |  |   |    +-- current syntax in
  "              | | | | |  |   |      square brackets
  "              | | | | |  |   +-- current fileformat
  "              | | | | |  +-- number of lines
  "              | | | | +-- preview flag in square brackets
  "              | | | +-- help flag in square brackets
  "              | | +-- readonly flag in square brackets
  "              | +-- rodified flag in square brackets
  "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
  set completeopt= " don't use a pop up menu for completions
  set expandtab " no real tabs please!
  set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
  set ignorecase " case insensitive by default
  set infercase " case inferred by default
  set nowrap " do not wrap line
  set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
  set smartcase " if there are caps, go case-sensitive
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
" }

" Folding {
  set foldenable " Turn on folding
  set foldmarker={,} " Fold C style code (only use this as default if you use a high foldlevel)
  set foldmethod=marker " Fold on the marker
  set foldlevel=100 " Don't autofold anything (but I can still fold manually)
  set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
  function SimpleFoldText()
    return getline(v:foldstart).' '
  endfunction
  set foldtext=SimpleFoldText() " Custom fold text function
" }

" Mappings {
  map <F12> ggVGg?

  " Make arrow keys do buffer stuff
    map <down> :bn<RETURN>
    map <left> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <right> :BufOnly<RETURN>
    map <up> :bp<RETURN>

  " Split navigation ctrl-[hjkl]
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>
" }

" Autocommands {
  " Stuff
    au BufWritePre * :%s/\s\+$//e " Remove trailing whitespace before saving
" }

" NERDTree {
  let NERDTreeShowLineNumbers=1
  let NERDTreeMinimalUI=1
  let NERDTreeShowHidden=1
  let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.svn$', '\.bundle$', '\.sass-cache$']
" }

" GUI Settings {
if has("gui_running")

  " Basics {
    set transparency=9
    set lines=200 columns=200
    set guioptions=cer
    set mousehide " hide the mouse cursor when typing
  " }

  " Powerline {
    so ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
    set guifont=Menlo\ for\ Powerline
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
  " }
endif
" }
