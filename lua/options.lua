require "nvchad.options"

vim.g.mapleader = " "
vim.g.encoding = "utf8"

vim.cmd [[
set nobackup
set nowritebackup
set noswapfile
set hidden
set background=dark
set nowrap
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
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamedplus
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
set guifont=FiraCode\ NF:h14

let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_remember_window_size = v:true
let g:python3_host_prog = '/usr/bin/python3'

let g:neovide_input_macos_alt_is_meta=v:true

let g:im_select_default = 'com.apple.keylayout.ABC'
let g:Easymotion_do_mapping=0

let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_date_format = '%y-%m-%d'
let g:blamer_template = '<committer> <summary> at <committer-time>'
au CursorHold * checktime  
autocmd FileType qf nnoremap <buffer> <esc> :quit<cr>
]]
