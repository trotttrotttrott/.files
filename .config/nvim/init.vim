set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'duff/vim-bufonly', { 'on': 'BufOnly' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-markdown'
Plug 'gyim/vim-boxdraw'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'leafgarland/typescript-vim'
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

map <c-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.svn$', '\.bundle$', '\.sass-cache$', 'node_modules$']
let NERDTreeWinSize = 40
" Close vim if all that's left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
