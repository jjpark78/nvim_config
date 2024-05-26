---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- require "plugins.configs.lspconfig"
      require "custom.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "rasulomaroff/reactive.nvim",
    config = function()
      require("reactive").setup {
        builtin = {
          cursorline = true,
          cursor = true,
          modemsg = true,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        "biome",
        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        -- "deno",
        -- "prettier",

        -- c/cpp stuff
        -- "clangd",
        -- "clang-format",
      },
    },
  },
  {
    "olimorris/persisted.nvim",
    lazy = false,
    config = function()
      require "custom.persisted"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        -- "c",
        "markdown",
        "markdown_inline",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      require "custom.lspsaga"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>fb",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    init = function()
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format { async = true, lsp_fallback = true, range = range }
      end, { range = true })
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format { bufnr = args.buf }
        end,
      })
    end,
    config = function()
      require "custom.conform"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "custom.project"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "custom.telescope"
    end,
  },
  {
    "startup-nvim/startup.nvim",
    lazy = false,
    config = function()
      require "custom.dashboard"
    end,
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
    config = function()
      require "custom.floaterm"
    end,
  },
  { "tpope/vim-surround", lazy = false },
  { "easymotion/vim-easymotion", lazy = false },
  -- { "APZelos/blamer.nvim",       lazy = false, },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    config = function()
      require "custom.multiedit"
    end,
  },
  { "p00f/nvim-ts-rainbow", lazy = false },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    config = function()
      require "custom.lazygit"
    end,
  },
  {
    "dawsers/telescope-floaterm.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension "floaterm"
    end,
  },
  {
    "David-Kunz/gen.nvim",
    lazy = false,
    opts = {
      model = "llama3", -- The default model to use.
      host = "localhost", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      quit_map = "q", -- set keymap for close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      init = function(options)
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      debug = false, -- Prints errors and the command which is run.
    },
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
  -- {
  --   "codota/tabnine-nvim",
  --   enabled = true,
  --   build = "./dl_binaries.sh",
  --   event = "VeryLazy",
  --   config = function()
  --     require("tabnine").setup {
  --       disable_auto_comment = true,
  --       accept_keymap = "<C-g>",
  --       dismiss_keymap = "<C-x>",
  --       debounce_ms = 800,
  --       suggestion_color = { gui = "#808080", cterm = 244 },
  --       exclude_filetypes = { "TelescopePrompt" },
  --     }
  --   end,
  -- },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    enabled = true,
    lazy = false,
    build = function()
      require("gitlab.server").build(true)
    end,
    config = function()
      require("gitlab").setup()

      local gitlab = require "gitlab"
      local gitlab_server = require "gitlab.server"
      vim.keymap.set("n", "glb", gitlab.choose_merge_request)
      vim.keymap.set("n", "glr", gitlab.review)
      vim.keymap.set("n", "gls", gitlab.summary)
      vim.keymap.set("n", "glA", gitlab.approve)
      vim.keymap.set("n", "glR", gitlab.revoke)
      vim.keymap.set("n", "glc", gitlab.create_comment)
      vim.keymap.set("v", "glc", gitlab.create_multiline_comment)
      vim.keymap.set("v", "glC", gitlab.create_comment_suggestion)
      vim.keymap.set("n", "glO", gitlab.create_mr)
      vim.keymap.set("n", "glm", gitlab.move_to_discussion_tree_from_diagnostic)
      vim.keymap.set("n", "gln", gitlab.create_note)
      vim.keymap.set("n", "gld", gitlab.toggle_discussions)
      vim.keymap.set("n", "glaa", gitlab.add_assignee)
      vim.keymap.set("n", "glad", gitlab.delete_assignee)
      vim.keymap.set("n", "glla", gitlab.add_label)
      vim.keymap.set("n", "glld", gitlab.delete_label)
      vim.keymap.set("n", "glra", gitlab.add_reviewer)
      vim.keymap.set("n", "glrd", gitlab.delete_reviewer)
      vim.keymap.set("n", "glp", gitlab.pipeline)
      vim.keymap.set("n", "glo", gitlab.open_in_browser)
      vim.keymap.set("n", "glM", gitlab.merge)
      vim.keymap.set("n", "glu", gitlab.copy_mr_url)
      vim.keymap.set("n", "glP", gitlab.publish_all_drafts)
      vim.keymap.set("n", "glD", gitlab.toggle_draft_mode)
    end,
  },
}

return plugins
