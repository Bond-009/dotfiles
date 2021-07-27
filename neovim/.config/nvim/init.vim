set langmenu=en_US
let $LANG = 'en_US'

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Visual theme
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'

Plug 'w0rp/ale'

" tmux powerline generator
" Plug 'edkolev/tmuxline.vim'

" Language Support
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Autocomplete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

" Theme
set background=dark
colorscheme codedark
let g:airline_theme = 'codedark'
hi Normal ctermbg=NONE guibg=NONE
"hi NonText ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE

" General settings
"set termguicolors
set number
set nowrap
set mouse=a " Enable mouse in all modes
set colorcolumn=80
au VimLeave * set guicursor=a:ver10-blinkon0

" Speed
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set ttyfast
set lazyredraw
set synmaxcol=500

" Default indent settings
set expandtab! " Don't replace tabs with spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set cindent

" Keybinds
map <C-f> /
map <C-s> :w<Cr>
" Open file keybind
map <C-p> :Files<Cr>

" Permanent undo
set undodir=~/.vimdid
set undofile

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

let g:tex_flavor = 'latex'
