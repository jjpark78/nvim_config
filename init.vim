" vim global config
set nobackup
set nocompatible
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
ret showmatch
set nu rnu
set sidescroll=5
set sidescrolloff=10
set softtabstop=2
set shortmess+=c
set nospell
set tabstop=2
set expandtab
set shiftwidth=2
set clipboard=unnamedplus
set smartindent
set termguicolors
set updatetime=100
set splitbelow
set splitright
set cmdheight=1
set t_Co=256
set cursorline
syntax enable
set visualbell 
set t_vb=
filetype plugin on
filetype indent on
set formatoptions-=cro

set guifont=FiraCode\ NF,Gulim:h16

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"Plugin installed
call plug#begin('~/.vim/plugged')

" Utils
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'sirver/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wakatime/vim-wakatime'
Plug 'dylanaraps/root.vim'
Plug 'mhinz/vim-grepper'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim'
Plug 'stsewd/fzf-checkout.vim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'coreyja/fzf.devicon.vim'
Plug 'yggdroot/indentline'

" Edit & Text Object
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
"Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'thaerkh/vim-workspace'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'peterrincker/vim-argumentative'
Plug 'tommcdo/vim-lion'
Plug 'mhinz/vim-startify'
Plug 'blueyed/vim-diminactive'
Plug 'majutsushi/tagbar'

" LSP + Language
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Colors
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'ayu-theme/ayu-vim'

" Terminal 
Plug 'voldikss/vim-floaterm'
Plug 'voldikss/fzf-floaterm'

" Session
Plug 'tpope/vim-obsession'

"  weather
Plug 'mattn/webapi-vim'
Plug 'Wildog/airline-weather.vim'

" Jira Integration
Plug 'mnpk/vim-jira-complete'

" Markdown preview 
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

let g:indentLine_color_term = 245
let g:indentLine_char_list = ['┊']

" Weather 
let g:weather#area = 'Daejeon,KR'
let g:weather#unit = 'metric'
let g:weather#cache_file = '~/.weather'
let g:weather#cache_ttl = '1800'

" Vim root changer
let g:root#auto = 1

"" Gitlab 
" let g:gitlab_server_address = 'https://gitlab.com'
" let g:gitlab_private_token = 'bdWsiijYks3XWxLbDgHs'
" let g:automatically_insert_cache = 1

let g:fzf_session_path = '/home/jj/.local/share/nvim/session' 
"COC Lsp config
let g:coc_global_extensions = [
 \ 'coc-tsserver',
 \ 'coc-tabnine',
 \ 'coc-vetur',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ 'coc-ccls',
 \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" devicon setup
let g:webdevicons_enable = 1

"" colorscheme onedark
" let ayucolor="dark"

colorscheme onehalfdark
" let g:airline_theme='nord'

"Startify setup
let g:webdevicons_enable_startify = 1

" Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0 
let g:airline#extensions#tabline#formatter='unique_tail' 
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#hunks#enabled=0
let g:airline_section_z = '%3p%% %3l/%L ' 
let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_powerline_fonts=1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"tsx config
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

"json wih comment
autocmd FileType json syntax match Comment +\/\/.\+$+

let mapleader = " "

" Git Gutter
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

" Copy Paragraph
noremap cp yap<S-}>

" Aling Current Paragraph
noremap ap =ip

" Markdown Preview
let vim_markdown_preview_github=1

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent><leader>qq :q!<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>hrr :PlugInstall<CR>
nnoremap <leader>hru :PlugUpdate<CR>
nnoremap <leader>hro :so %<CR>
nnoremap <leader>hre :PlugClean<CR>
nnoremap <leader>hcc :CocConfig<CR>

map gw <Plug>(easymotion-overwin-f2)
map gl <Plug>(easymotion-overwin-line)

let g:tmux_navigator_no_mappings = 1

nnoremap <C-H> :TmuxNavigateLeft<cr>
nnoremap <C-J> :TmuxNavigateDown<cr>
nnoremap <C-K> :TmuxNavigateUp<cr>
nnoremap <C-L> :TmuxNavigateRight<cr>
nnoremap <C-\> :TmuxNavigatePrevious<cr>

nmap H ^
vmap H ^
nmap L $
vmap L $

nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wc :q<CR>
nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>
"Files, Buffers
let g:fzf_preview_window = ['up:60%', 'ctrl-/']

nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <leader>, :Buffers<CR>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>. :GFiles<CR>
nnoremap <silent> <leader>fev :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>fea :e ~/.config/alacritty/alacritty.yml<CR>
nnoremap <silent> <leader>fet :e ~/.tmux.conf<CR>
nnoremap <silent> <leader>fec :e ~/.config/nvim/coc-settings.json<CR>
nnoremap <silent> <leader>fez :e ~/.zshrc<CR>
nnoremap <silent> <leader>bc :bd<CR>

"LSP Action
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fb  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" show lsp linter messages
nmap <leader>cx  :CocDiagnostics<CR> 

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" COC Kill child process when quit vim
"
autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

"" Git & Fugitive binding
nmap <leader>gbl :GBranches<CR>
nmap <leader>gbc :GBranches create<CR>
nmap <leader>gbm :GBranches merge<CR>
nmap <leader>gtl :GTags<CR>
nmap <leader>gtc :GTags create<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gvdiff<CR>
nmap gdh :diffget //2<CR>
nmap gdl :diffget //3<CR>
nmap <leader>gcc :Git commit<CR>
nmap <leader>gpp :Git push<CR>
nmap <leader>gB :Gblame<CR>
nmap <leader>gPu :Gpull upstream<CR>
nmap <leader>gPo :Gpull origin<CR>
nmap <leader>gl  :0Glog<CR>
nmap <leader>gv :GV<CR>
nmap <leader>gV :GV!<CR>

" Move Line Action
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Toggle
nmap <leader>ta :AirlineToggle<CR>

" Execute Shell Command
nmap <leader>rgk :silent !gitkraken<CR>
nmap <leader>rgc :silent !google-chrome<CR>

" Search Buffer or Lines
nmap <leader>sl :BLines<CR> 
nmap <leader>sp :Rg<CR>
nmap <leader>sf :GFiles<CR>

" Buffer Actions
nmap <leader>bd :bd!<CR>

" Open Files from NTree
nmap <leader>od :Ntree<CR>
nmap <leader>ot :TagbarToggle<CR>

" Change Color scheme
nmap <leader>ot :TagbarToggle<CR>

" Change Color scheme
nnoremap <silent> <leader>hcs :call fzf#run({
  \ 'source': 
  \    map(split(globpath(&rtp, "colors/*.vim"), "\n"),
  \        "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  \ 'sink':    'colo',
  \ 'options': '+m',
  \ 'left':    30
  \ })<CR>

" Float Terminal Action
let g:floaterm_position = 'bottom'
let g:floaterm_width  = 1.0
let g:floaterm_height = 0.49
nnoremap   <silent><C-A-o>    :FloatermNew<CR>
tnoremap   <silent><C-A-o>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent><C-A-j>    :FloatermPrev<CR>
tnoremap   <silent><C-A-j>   <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent><C-A-k>    :FloatermNext<CR>
tnoremap   <silent><C-A-k>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent><C-A-h>   :FloatermToggle<CR>
tnoremap   <silent><C-A-h>   <C-\><C-n>:FloatermToggle<CR> 

nnoremap <leader>rdm :FloatermNew --cwd=<root> yarn dev<CR>

" Session Action
function! s:sessions()
  call fzf#run({
  \ 'source':  'ls -1 ~/.local/share/nvim/session',
  \ 'sink':    'SLoad',
  \ 'options': '+m --prompt="Sessions> "',
  \ 'down':    '10'
  \})
endfunction
command! Sessions call s:sessions()
nnoremap <leader><TAB>l :Sessions<CR>
nnoremap <leader><TAB>s :SSave<CR>

" TMuxinator Session files
function! s:tworkspace()
  call fzf#run({
  \ 'source':  'ls -d -1 ~/.config/tmuxinator/*.yml',
  \ 'sink':    'e',
  \ 'options': '+m --prompt="Tmuxinator> "',
  \ 'down':    '10'
  \})
endfunction

command! TMuxWorkspaces call s:tworkspace()
nnoremap <leader>fet :TMuxWorkspaces<CR>

