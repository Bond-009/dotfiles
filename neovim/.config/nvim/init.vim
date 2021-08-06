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
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'

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
map <C-g> :
map <C-s> :w<Cr>

" Permanent undo
set undodir=~/.vimdid
set undofile

" autocomplete
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
let g:compe = {}
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <Tab>     compe#confirm('<Tab>')

lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.rust_analyzer.setup{}

" fzf settings
" Open file keybind
map <C-p> :GFiles<Cr>
" Disable preview window
let g:fzf_preview_window = []

let g:tex_flavor = 'latex'
