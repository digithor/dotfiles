set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set wrap
set smartindent
set smarttab
set cursorline
set autoindent
set linebreak
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set termguicolors
set scrolloff=3
set history=1000

" Automatic install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'nordtheme/vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'github/copilot.vim'
call plug#end()

colorscheme catppuccin_frappe

let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:airline_theme = 'catppuccin_frappe'
