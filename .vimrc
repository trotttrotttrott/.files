runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()

let $JS_CMD="node" " lintjs doesn't like Lion's js interpreter.

colorscheme vividchalk
syntax on
filetype plugin indent on

" General {
  set backup " make backup files
  set backspace=indent,eol,start " make backspace a more flexible
  set backupdir=~/.vim/backup " where to put backup files
  set directory=~/.vim/tmp " directory to place swap files in
  set clipboard=unnamed " share clipboard
  set hidden " you can change buffers without saving
  set incsearch " highlight as you type you search phrase
  set laststatus=2 " always show statusline
  set listchars=tab:>-,trail:- " show tabs and trailing spaces
  set nocompatible " explicitly get out of vi-compatible mode
  set noerrorbells " don't make noise
  set noexrc " don't use local version of .(g)vimrc, .exrc
  set number
  set ruler
" }

" Text Formatting/Layout {
  set completeopt= " don't use a pop up menu for completions
  set ignorecase " case insensitive by default
  set infercase " case inferred by default
  set nowrap " do not wrap line
  set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
  set smartcase " if there are caps, go case-sensitive
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab " use soft tabs by default
" }

" Folding {
  set foldenable
  set foldmethod=manual
" }

" Mappings {

  " NERDTree
    map <c-n> :NERDTreeToggle<CR>

  " Split navigation ctrl-[hjkl]
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>
" }

" Autocommands {

  " Remove trailing whitespace before saving
    au BufWritePre * :%s/\s\+$//e

  " Close vim if all that's left is nerdtree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " use real tabs with go
    autocmd FileType go setlocal noexpandtab
" }

" NERDTree {
  let NERDTreeShowLineNumbers=1
  let NERDTreeMinimalUI=1
  let NERDTreeShowHidden=1
  let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.svn$', '\.bundle$', '\.sass-cache$']
  let NERDTreeWinSize = 40
" }
