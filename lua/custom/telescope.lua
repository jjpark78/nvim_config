local actions = require "telescope.actions"
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        width = 0.8
      }
    }
  },
	pickers = {
		live_grep = {
			mappings = {
				i = { ["<C-f>"] = actions.to_fuzzy_refine }
			}
		},
		lsp_workspace_symbols = {
			mappings = {
				i = { ["<C-f>"] = actions.to_fuzzy_refine }
			}
		}
	}
})

require('telescope').load_extension("themes")
require('telescope').load_extension("projects")
require('telescope').load_extension("lazygit")
