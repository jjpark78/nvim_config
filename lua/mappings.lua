require "nvchad.mappings"

local harpoon = require "harpoon"
local map = vim.keymap.set

map("n", "<leader>fek", ":e ~/.config/nvim/lua/mappings.lua<CR>", { desc = "Keyboard" })
map("n", "<leader>fep", ":e ~/.config/nvim/lua/plugins/init.lua<CR>", { desc = "Plugin" })
map("n", "<leader>fez", ":e ~/.zshenv<CR>", { desc = "Zshell" })
map("n", "<leader>fet", ":e ~/.config/kitty/kitty.conf<CR>", { desc = "Kitty" })
map("n", "<leader>fex", ":e ~/.tmux.conf<CR>", { desc = "Tmux" })
map("n", "<leader>fet", ':Telescope find_files search_dirs={"~/.config/tmuxinator"}<CR>', { desc = "Tmuxinator" })
map("n", "<leader>fea", ":e ~/.config/alacritty/alacritty.toml<CR>", { desc = "Alacritty" })
map("n", "<leader>feh", ":e ~/.hammerspoon/init.lua<CR>", { desc = "Hammerspoon Config" })
map("n", "<leader>fey", ":e ~/.hyper.js<CR>", { desc = "Hyperterm Config" })
--
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", { desc = "Find files" })
map("n", "<leader>,", "<cmd>Telescope buffers<CR>", { desc = "Opend buffers" })
map("n", "<leader>.", "<cmd>Telescope git_files<CR>", { desc = "Git files" })
map("n", "<leader>fs", ":lua vim.lsp.buf.format()<CR>:w<CR>", { desc = "Save to disk buffer" })
map("n", "<leader>bc", ":bw<CR>", { desc = "Close current buffer" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>pp", "<cmd>Telescope projects<CR>", { desc = "Project list" })
--
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move Up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==", { desc = "Move Up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==", { desc = "Move Down" })
--
map("n", "H", "^", { desc = "move to line first" })
map("n", "L", "$", { desc = "move to line last" })
--
map("v", "H", "^", { desc = "move to line first" })
map("v", "L", "$", { desc = "move to line last" })
--
-- map("n", "<C-h>", "<C-w><C-h>", { desc = "move cursor to left pane" })
-- map("n", "<C-l>", "<C-w><C-l>", { desc = "move cursor to right pane" })
-- map("n", "<C-j>", "<C-w><C-j>", { desc = "move cursor to down pane" })
-- map("n", "<C-k>", "<C-w><C-k>", { desc = "move cursor to up pane" })

map("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>ws", ":split<CR>", { desc = "Horizontal Split" })
map("n", "<leader>wO", ":only<CR>", { desc = "Only this Window" })
map("n", "<leader>wc", ":q<CR>", { desc = "Close not split but buffer" })
map("n", "<leader>w=", "<C-W>=", { desc = "Same width window layout" })
--
map("n", "<leader>qq", ":qa!<CR> ", { desc = "Quit neovim" })
--
map("n", "gw", "<Plug>(easymotion-overwin-f2)", { desc = "Jump to 2-word" })
map("n", "gj", "<Plug>(easymotion-overwin-line)", { desc = "Jump to line" })
--
map("n", "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search Line" })
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search File" })
map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search LSP Symbol" })
map("n", "<leader>sp", "<cmd>Telescope live_grep<CR>", { desc = "Search Project" })
map("n", "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Search Workspace Symbol" })
--
map("n", "<leader>od", ":NvimTreeOpen<CR>", { desc = "Open Directory Explorer" })
--
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Not Fugitive But LazyGit" })
map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Diff view open" })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Diff view close" })
map("n", "<leader>dl", ":DiffviewFileHistory %<CR>", { desc = "Diff File history" })
--
map("n", "<leader>qn", ":cn<CR>", { desc = "quickfix next" })
map("n", "<leader>qo", ":co<CR>", { desc = "quickfix open" })
map("n", "<leader>qp", ":cp<CR>", { desc = "quickfix previous" })
map("n", "<leader>qc", ":ccl<CR>", { desc = "quickfix close" })
--
map("n", "gr", ":Telescope lsp_references<CR>", { desc = "LSP References" })
map("n", "gR", ":Lspsaga rename<CR>", { desc = "LSP Saga Rename symbol" })
map("n", "K", ":Lspsaga hover_doc<CR>", { desc = "LSP Saga Show Document" })
map("n", "<leader>bf", ":Format<CR>", { desc = "Conform Buffer format" })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { desc = "LSP Buffer format" })
map("n", "<leader>ee", ":Lspsaga show_line_diagnostics<CR>", { desc = "LSP Buffer format" })
map("n", "gD", ":Lspsaga preview_definition<CR>", { desc = "LSP Saga Preview definition" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP Goto definition" })
map("n", "gh", "<c-w><c-o>:vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "LSP Goto definition in vertical" })
map("n", "<leader>cx", ":Telescope diagnostics<CR>", { desc = "Diagnostics in quickfix" })
map("n", "<leader>ss", ":Telescope lsp_document_symbols<CR>", { desc = "Search Symbols in Buffer" })
--
map("n", "<leader>ht", ":Telescope themes<CR>", { desc = "Change colorscheme" })
map("n", "<esc><esc><esc>", ":noh<CR>", { desc = "noh" })
--
map("n", "<leader><TAB>p", ":Telescope projects<CR>", { desc = "Select Project" })
map("n", "<leader><TAB>l", ":Telescope persisted<CR>", { desc = "Select Session" })
map("n", "<leader><TAB>s", ":SessionSave<CR>", { desc = "Save Session" })

map("n", "<A-;>", ":FloatermToggle<CR>", { desc = "Toggle Terminal" })
map(
  "n",
  "<A-,>",
  ":FloatermNew --wintype=float --width=0.99 --height=0.5 --position=bottom<CR>",
  { desc = "New Terminal in horizontal" }
)
map(
  "n",
  "<A-.>",
  ":FloatermNew --wintype=float --width=0.59 --height=0.99 --position=right<CR>",
  { desc = "New Terminal in vertical" }
)

map("t", "<A-k>", "<C-\\><C-n>:FloatermNext<CR>", { desc = "Next Terminal" })
map("t", "<A-j>", "<C-\\><C-n>:FloatermPrev<CR>", { desc = "Prev Terminal" })
map(
  "t",
  "<A-,>",
  "<C-\\><C-n>:FloatermNew --wintype=float --width=0.98 --height=0.7 --position=bottom<CR>",
  { desc = "New Terminal" }
)
map("t", "<A-;>", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "Toggle Terminal" })

vim.keymap.set("n", "<esc>", function()
  if vim.api.nvim_get_vvar "hlsearch" == 1 then
    return ":nohl<CR><esc>"
  end

  return "<esc>"
end, { silent = true, noremap = true })

harpoon:setup()

vim.keymap.del("n", "<leader>h")

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end)

vim.keymap.set("n", "<leader>he", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)

vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)
return M
