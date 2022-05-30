vim.g.mapleader = ' '
vim.g.encoding = "utf8"

vim.cmd([[
set nobackup
set nowritebackup
set noswapfile
set hidden
set background=dark
set nowrap
set autochdir
set autoread
set autowrite
set foldlevel=99
set foldmethod=manual
set scrolloff=12
set shiftwidth=2
set showmatch
set nu rnu
set softtabstop=2
set shortmess+=c
set nospell
set tabstop=2
set expandtab
set shiftwidth=2
set clipboard+=unnamedplus
set smartindent
set termguicolors
set updatetime=100
set splitbelow
set splitright
set cmdheight=1
set cursorline
syntax enable
filetype plugin on
filetype indent on
set formatoptions-=cro

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set guifont=FiraMono\ NF:h10

let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_remember_window_size = v:true
]])
