set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-sensible'
Plug 'duff/vim-bufonly'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-markdown'
Plug 'gyim/vim-boxdraw'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'google/vim-jsonnet'
Plug 'jjo/vim-cue'
Plug 'hashivim/vim-terraform'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" nerdtree
map <c-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.svn$', '\.bundle$', '\.sass-cache$', 'node_modules$']
let NERDTreeWinSize = 40
" Close vim if all that's left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" goyo
let g:goyo_width = '60%'
let g:goyo_linenr = 1

" coc
source ~/.config/nvim/coc.vim
" only use autocomplete on go files.
autocmd FileType * if &filetype != "go" | let b:coc_suggest_disable = 1 | endif

" vim-terraform
let g:terraform_fmt_on_save=1
