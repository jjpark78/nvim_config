local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<M-w>"] = trouble.open_with_trouble },
      n = { ["<M-w>"] = trouble.open_with_trouble },
    },
  },
}
