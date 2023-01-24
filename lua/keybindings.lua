local wk = require("which-key")

local function map(mode, shortcut, command, desc)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
  wk.register(
    {
      [shortcut] = { command, desc }
    }
  )
end

local function nmap(shortcut, command, desc)
  map("n", shortcut, command, desc)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

local function tmap(shortcut, command)
  map("t", shortcut, command)
end

-- quick access to specific files macro
nmap("<leader>fev", ":e ~/.config/nvim/lua/global.lua<CR>", "Jump to init.lua")
nmap("<leader>fek", ":e ~/.config/nvim/lua/keybindings.lua<CR>", "Jump to keybindings.lua")
nmap("<leader>fep", ":e ~/.config/nvim/lua/plugins.lua<CR>", "Jump to plugins.lua")
nmap("<leader>fez", ":e ~/.zsh_env<CR>", "Jump to ZSH Personal ENV Config")
nmap("<leader>fea", ":e ~/.config/alacritty/alacritty.yml<CR>", "Jump to Alacritty Config")
nmap("<leader>feh", ":e ~/.hammerspoon/init.lua<CR>", "Jump to Hammerspoon Config")
nmap("<leader>fey", ":e ~/.hyper.js<CR>", "Jump to Hyper-term Config")
nmap("<leader>fet", ":e ~/.config/tmuxinator<CR>", "Jump to Tmuxinator Session Config")

-- reload, install plugins, cleanup plugins
nmap("<leader>hrr", ":so ~/.config/nvim/init.lua<CR>:PackerInstall<CR>", "Reload configuration")
nmap("<leader>hrc", ":PackerClean<CR>", "Packer clean command")
nmap("<leader>hro", ":so %<CR>", "Apply this Buffer")
nmap("<leader>hru", ":PackerUpdate<CR>", "Packer update command")

-- buffer, files actions
nmap("<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", "Find files")
nmap("<leader><leader>", "<cmd>Telescope find_files hidden=true<CR>", "Find files")
nmap("<leader>,", "<cmd>Telescope buffers<CR>", "Opend buffers")
nmap("<leader>.", "<cmd>Telescope git_files<CR>", "Git files")
nmap("<leader>fs", ":lua vim.lsp.buf.format()<CR>:w<CR>", "Save to disk buffer")
nmap("<leader>bc", ":bw<CR>", "Close current buffer")
nmap("<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent files")
nmap("<leader>pp", "<cmd>Telescope projects<CR>", "Project list")

-- sessions
-- nmap(
--   "<leader><TAB>s",
--   ":lua require('auto-session').SaveSession(require('auto-session').get_root_dir() .. vim.fn.input('SessionName > '))<CR>",
--   "Save Session File"
-- )
-- nmap("<leader><TAB>l", ":SearchSession<CR>", "List Session File")
-- nmap('<leader><TAB>l', ':Sessions<CR>')
-- nmap('<leader><TAB>s', ':SSave<CR>')

-- search
nmap("<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search Line")
nmap("<leader>sf", "<cmd>Telescope find_files<CR>", "Search File")
nmap("<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", "Search LSP Symbol")
nmap("<leader>sp", "<cmd>Telescope live_grep<CR>", "Search Project")
nmap("<leader>sS", "<cmd>Telescope lsp_workspace_symbols<CR>", "Search Workspace Symbol")

-- comment

-- git operation
nmap("<leader>gg", ":LazyGit<CR>", "Not Fugitive But LazyGit")
nmap("<leader>dv", ":DiffviewOpen<CR>", "Diff view open")
nmap("<leader>dc", ":DiffviewClose<CR>", "Diff view close")
nmap("<leader>dl", ":DiffviewFileHistory %<CR>", "Diff File history")

-- line head, tail macro
nmap("H", "^", "")
vmap("H", "^")
nmap("L", "$", "")
vmap("L", "$")

-- jump to word or line
nmap("gw", "<Plug>(easymotion-overwin-f2)", "Jump to 2-word")
nmap("gl", "<Plug>(easymotion-overwin-line)", "Jump to line")

-- move line
imap("<M-k>", "<Esc>:m .-2<CR>==")
nmap("<M-k>", ":m .-2<CR>==", "")
vmap("<M-j>", ":m '>+1<CR>gv=gv")
vmap("<M-k>", ":m '<-2<CR>gv=gv")
imap("<M-j>", "<Esc>:m .+1<CR>==")
nmap("<M-j>", ":m .+1<CR>==", "")

-- move focus to other windows
nmap("<C-h>", "<C-w><C-h>")
nmap("<C-l>", "<C-w><C-l>")
nmap("<C-j>", "<C-w><C-j>")
nmap("<C-k>", "<C-w><C-k>")

-- window actions
nmap("<leader>wv", ":vsplit<CR>", "Vertical Split")
nmap("<leader>ws", ":split<CR>", "Horizontal Split")
nmap("<leader>wc", ":q<CR>", "Close Window")
nmap("<leader>wO", ":only<CR>", "Only this Window")

-- navigate windows
nmap("<leader>wh", "<C-w><C-h>", "Move to left window")
nmap("<leader>wl", "<C-w><C-l>", "Move to right window")
nmap("<leader>wj", "<C-w><C-j>", "Move to bottom window")
nmap("<leader>wk", "<C-w><C-k>", "Move to upper window")

-- folder explorer
nmap("<leader>od", ":NvimTreeToggle<CR>", "Open Directory Explorer")

-- terminal
tmap("<M-\\>", "<C-\\><C-n>:FloatermToggle<CR>")
nmap("<M-\\>", ":FloatermToggle<CR>", "Toggle Terminal")
nmap("<M-,>", ":FloatermNew --wintype=float --width=0.98 --height=0.5 --position=bottom<CR>", "New Terminal")
tmap("<M-,>", "<C-\\><C-n>:FloatermNew --wintype=float --width=0.98 --height=0.5 --position=bottom<CR>")
tmap("<M-k>", "<C-\\><C-n>:FloatermNext<CR>")
tmap("<M-j>", "<C-\\><C-n>:FloatermPrev<CR>")
-- tmap("<esc><esc>", "<C-\\><C-n>")

-- quickfix & location list
nmap("<leader>qn", ":cn<CR>", "quickfix next")
nmap("<leader>qo", ":co<CR>", "quickfix open")
nmap("<leader>qp", ":cp<CR>", "quickfix previous")
nmap("<leader>qc", ":ccl<CR>", "quickfix close")

-- some of git operation
nmap("<leader>gfl", ":DiffviewFileHistory %<CR>", "git file history")

-- etc
nmap("<leader>ht", ":Telescope themes<CR>", "Change colorscheme")
nmap("<esc><esc><esc>", ":noh<CR>", "noh")

-- lsp + lspsaga
nmap("gr", ":Lspsaga lsp_finder<CR>", "LSP Saga Find References")
nmap("gR", ":Lspsaga rename<CR>", "LSP Saga Rename symbol")
nmap("K", ":Lspsaga hover_doc<CR>", "LSP Saga Show Document")
nmap("<leader>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Buffer format")
nmap("<leader>ca", ":Lspsaga code_action<CR>", "LSP Buffer format")
nmap("<leader>ee", ":Lspsaga show_line_diagnostics<CR>", "LSP Buffer format")
nmap("gD", ":Lspsaga preview_definition<CR>", "LSP Saga Preview definition")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Goto definition")
nmap("<leader>cx", ":Telescope diagnostics<CR>", "Diagnostics in quickfix")
nmap("<leader>ss", ":Telescope lsp_document_symbols<CR>", "Search Symbols in Buffer")

-- snippets
vim.cmd(
  [[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]
)
-- undo tree
nmap("<leader>uu", ":UndotreeToggle<CR>", "")
-- markdown
nmap("<leader>ii", ":PasteImg<CR>", "store image from clipboard, and insert image markdown to buffer")
-- exit neovim
nmap("<leader>qq", ":qa<CR>", "Quit neovim")
