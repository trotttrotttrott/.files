colorscheme vividchalk

" General {
  set nobackup
  set nowritebackup
  set directory=~/.vim/tmp " directory to place swap files in
  set clipboard=unnamed " share clipboard
  set hidden " you can change buffers without saving
  set list " show whitespace
  set nocompatible " explicitly get out of vi-compatible mode
  set noerrorbells " don't make noise
  set noexrc " don't use local version of .(g)vimrc, .exrc
  set nomodeline " ignore modeline settings in files
  set number relativenumber " show numbers relative to position
  set virtualedit=all " cursor can select empty cells
" }

" Text Formatting/Layout {
  set ignorecase " case insensitive by default
  set nowrap " do not wrap line
  set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
  set smartcase " if there are caps, go case-sensitive
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab " use soft tabs by default
" }
"
" Relative Number {
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
" }

" Folding {
  set foldenable
  set foldmethod=manual
" }

" Mappings {

  " Split navigation ctrl-[hjkl]
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>
" }

" Autocommands {

  " Remove trailing whitespace before saving
    au BufWritePre * :%s/\s\+$//e

  " Markdown files have 80 char line length
    au BufRead,BufNewFile *.md setlocal textwidth=80

" }
