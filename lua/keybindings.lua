local wk = require("which-key")

local function map(mode, shortcut, command, desc)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
  wk.register({
    [shortcut] = { command, desc }
  })
end

local function nmap(shortcut, command, desc)
  map('n', shortcut, command, desc)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- quick access to specific files macro
nmap('<leader>fev', ':e ~/.config/nvim/init.lua<CR>', 'Jump to init.lua')
nmap('<leader>fek', ':e ~/.config/nvim/lua/keybindings.lua<CR>', 'Jump to keybindings.lua')
nmap('<leader>fep', ':e ~/.config/nvim/lua/plugins.lua<CR>', 'Jump to plugins.lua')
nmap('<leader>fez', ':e ~/.zsh_env<CR>', 'Jump to ZSH Personal ENV Config')

-- reload, install plugins, cleanup plugins
nmap('<leader>hrr', ':so ~/.config/nvim/init.lua<CR>:PackerInstall<CR>', 'Reload configuration')
nmap('<leader>hro', ':so %<CR>', 'Apply this Buffer')
nmap('<leader>hrc', ':PackerClean<CR>', 'Packer clean command')
nmap('<leader>hru', ':PackerUpdate<CR>', 'Packer update command')

-- buffer, files actions
nmap('<leader>ff', '<cmd>Telescope find_files<CR>', 'Find files')
nmap('<leader>,', '<cmd>Telescope buffers<CR>', 'Opend buffers')
nmap('<leader>.', '<cmd>Telescope git_files<CR>', 'Git files')
nmap('<leader>fs', ':w<CR>', 'Save to disk buffer')
nmap('<leader>bc', ':bw<CR>', 'Close current buffer')
nmap('<leader>fr', '<cmd>Telescope oldfiles<CR>', 'Recent files')
nmap('<leader>pp', '<cmd>Telescope projects<CR>', 'Project list')

-- sessions
nmap('<leader><TAB>s', ":lua require('auto-session').SaveSession(require('auto-session').get_root_dir() .. vim.fn.input('SessionName > '))<CR>", 'Save Session File')
nmap('<leader><TAB>l', ":SearchSession<CR>", 'List Session File')
-- nmap('<leader><TAB>l', ':Sessions<CR>')
-- nmap('<leader><TAB>s', ':SSave<CR>')

-- search
nmap('<leader>sl', '<cmd>Telescope current_buffer_fuzzy_find<CR>', 'Search Line')
nmap('<leader>sp', '<cmd>Telescope live_grep<CR>', 'Search Project')
nmap('<leader>ss', '<cmd>Telescope lsp_document_symbols<CR>', 'Search LSP Symbol')
nmap('<leader>sS', '<cmd>Telescope lsp_workspace_symbols<CR>', 'Search Workspace Symbol')

-- comment

-- git operation
nmap('<leader>gg', ':LazyGit<CR>', 'Not Fugitive But LazyGit')

-- line head, tail macro
nmap('H', '^', '')
vmap('H', '^')
nmap('L', '$', '')
vmap('L', '$')

-- jump to word or line
nmap('gw', '<Plug>(easymotion-overwin-f2)', 'Jump to 2-word')
nmap('gl', '<Plug>(easymotion-overwin-line)', 'Jump to line')

-- move line
nmap('<A-j>', ':m .+1<CR>==', '')
nmap('<A-k>', ':m .-2<CR>==', '')
imap('<A-j>', '<Esc>:m .+1<CR>==')
imap('<A-k>', '<Esc>:m .-2<CR>==')
vmap('<A-j>', ":m '>+1<CR>gv=gv")
vmap('<A-k>', ":m '<-2<CR>gv=gv")

-- window actions
nmap('<leader>wv', ':vsplit<CR>', 'Vertical Split')
nmap('<leader>ws', ':split<CR>', 'Horizontal Split')
nmap('<leader>wc', ':q<CR>', 'Close Window')
nmap('<leader>wO', ':only<CR>', 'Only this Window')

-- navigate windows
nmap('<C-h>', '<C-w><C-h>', 'Move to left window')
nmap('<C-l>', '<C-w><C-l>', 'Move to right window')
nmap('<C-j>', '<C-w><C-j>', 'Move to bottom window')
nmap('<C-k>', '<C-w><C-k>', 'Move to upper window')

-- folder explorer
nmap('<leader>od', ':NvimTreeToggle<CR>', 'Open Directory Explorer')

-- terminal
nmap('<A-\\>', ':FloatermToggle<CR>', 'Toggle Terminal')
tmap('<A-\\>', '<C-\\><C-n>:FloatermToggle<CR>')
nmap('<A-,>', ':FloatermNew --wintype=float --width=0.98 --height=0.5 --position=bottom<CR>', 'New Terminal')
tmap('<A-,>', '<C-\\><C-n>:FloatermNew --wintype=float --width=0.98 --height=0.5 --position=bottom<CR>')
tmap('<A-k>', '<C-\\><C-n>:FloatermNext<CR>')
tmap('<A-j>', '<C-\\><C-n>:FloatermPrev<CR>')

-- etc
nmap('<leader>ht', ':Telescope themes<CR>', 'Change colorscheme')

-- exit neovim
nmap('<leader>qq', ':qa<CR>', 'Quit neovim')
