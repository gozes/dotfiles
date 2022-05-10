vim.cmd([[
filetype plugin on
syntax on
" set leader key
let mapleader = "\<Space>"
let maplocalleader = ","
set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set clipboard=unnamedplus
" Undo function after reopening
set undofile
set undodir=/tmp
let g:netrw_home='~/.vim'
set relativenumber
set scrolloff=10
set noshowmode
set listchars=tab:>- ,trail:<>-,nbsp:+

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_altv = 1
hi! WinSeparator guibg=None
]])

vim.opt.laststatus = 3
