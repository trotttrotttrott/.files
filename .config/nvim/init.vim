set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin(stdpath('data') . '/plugged')

" tpope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Syntax
Plug 'aklt/plantuml-syntax'
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'ianks/vim-tsx'
Plug 'jjo/vim-cue'
Plug 'leafgarland/typescript-vim'
Plug 'LnL7/vim-nix'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Diagrams
Plug 'scrooloose/vim-slumlord'
Plug 'gyim/vim-boxdraw'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Stuff
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ivalkeen/nerdtree-execute', { 'on': 'NERDTreeToggle' }
Plug 'liuchengxu/eleline.vim'
Plug 'duff/vim-bufonly'

call plug#end()

" Command-line mode scrolls cursor instead instead of entire buffer
" Overrides nvim default, mouse=nvi
set mouse=c

" nerdtree
map <c-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.svn$', '\.bundle$', '\.sass-cache$', 'node_modules$']
let NERDTreeWinSize = 40
" Close vim if all that's left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" coc
source ~/.config/nvim/coc.vim
" only use autocomplete on go files.
autocmd FileType * if &filetype != "go" | let b:coc_suggest_disable = 1 | endif

" vim-terraform
let g:terraform_fmt_on_save=1

" markdown-preview
let g:mkdp_theme = 'light'
