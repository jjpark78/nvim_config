
vim.cmd [[
  autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
]]

vim.g.lazy_git_float_window_winblend = 0
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.96 -- scaling factor for floating window
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
-- vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
