---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "vscode_dark",
  theme_toggle = { "vscode_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "vscode_colored",
  },

  tabufline = {
    lazyload = false,
  },
}

M.plugins = "plugins"

-- check core.mappings for table structure
M.mappings = require "mappings"

return M
