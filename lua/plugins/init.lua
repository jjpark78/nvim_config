local plugins = {
  --lazy
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "drop-stones/im-switch.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      set_previous_im_events = {},
      save_im_events = {},
      windows = {
        enabled = true,
      },
      mac = {
        enabled = true,
        default_im = "com.apple.keylayout.ABC", -- If you use Japanese, use "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman" instead
      },
      linux = {
        enabled = true,
        default_im = "keyboard-us",
        obtain_im_command = { "fcitx5-remote", "-n" },
        set_im_command = { "fcitx5-remote", "-s" },
      },
    },
  },
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
  -- {
  --   "olimorris/persisted.nvim",
  --   lazy = false,
  --   config = function()
  --     require "custom.persisted"
  --   end,
  -- },
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
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  --   config = function()
  --     require "custom.multiedit"
  --   end,
  -- },
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
    dependencies = { "folke/which-key.nvim" },
    cmd = "Gen",
    config = function()
      require("gen").setup {
        model = "llama3", -- The default model to use.
        display_mode = "split", -- The display mode. Can be "float" or "split".
        show_prompt = true, -- Shows the Prompt submitted to Ollama.
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = true, -- Never closes the window automatically.
      }
      require("gen").prompts["Unit_Test"] = {
        prompt = "write a unit test of function using vitest in forat ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        replace = false,
        extract = "```$filetype\n(.-)```",
      }
      require("gen").prompts["Fix_Code"] = {
        prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        replace = true,
        extract = "```$filetype\n(.-)```",
      }
      -- TODO: figure out how this works
      -- require("which-key").register({ a = { name = "+AI" } }, { prefix = "<leader>", mode = "v" })
    end,
    keys = {
      vim.keymap.set("v", "<leader>af", "<cmd>Gen Fix_Code<CR>", { desc = "Fix Code" }),
      vim.keymap.set("v", "<leader>at", "<cmd>Gen Unit_Test<CR>", { desc = "Unit Test" }),
    },
  },
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
  -- {
  --   "harrisoncramer/gitlab.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "sindrets/diffview.nvim",
  --     "stevearc/dressing.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   enabled = true,
  --   lazy = false,
  --   build = function()
  --     require("gitlab.server").build(true)
  --   end,
  --   config = function()
  --     require("gitlab").setup()
  --
  --     local gitlab = require "gitlab"
  --     local gitlab_server = require "gitlab.server"
  --     vim.keymap.set("n", "glb", gitlab.choose_merge_request)
  --     vim.keymap.set("n", "glr", gitlab.review)
  --     vim.keymap.set("n", "gls", gitlab.summary)
  --     vim.keymap.set("n", "glA", gitlab.approve)
  --     vim.keymap.set("n", "glR", gitlab.revoke)
  --     vim.keymap.set("n", "glc", gitlab.create_comment)
  --     vim.keymap.set("v", "glc", gitlab.create_multiline_comment)
  --     vim.keymap.set("v", "glC", gitlab.create_comment_suggestion)
  --     vim.keymap.set("n", "glO", gitlab.create_mr)
  --     vim.keymap.set("n", "glm", gitlab.move_to_discussion_tree_from_diagnostic)
  --     vim.keymap.set("n", "gln", gitlab.create_note)
  --     vim.keymap.set("n", "gld", gitlab.toggle_discussions)
  --     vim.keymap.set("n", "glaa", gitlab.add_assignee)
  --     vim.keymap.set("n", "glad", gitlab.delete_assignee)
  --     vim.keymap.set("n", "glla", gitlab.add_label)
  --     vim.keymap.set("n", "glld", gitlab.delete_label)
  --     vim.keymap.set("n", "glra", gitlab.add_reviewer)
  --     vim.keymap.set("n", "glrd", gitlab.delete_reviewer)
  --     vim.keymap.set("n", "glp", gitlab.pipeline)
  --     vim.keymap.set("n", "glo", gitlab.open_in_browser)
  --     vim.keymap.set("n", "glM", gitlab.merge)
  --     vim.keymap.set("n", "glu", gitlab.copy_mr_url)
  --     vim.keymap.set("n", "glP", gitlab.publish_all_drafts)
  --     vim.keymap.set("n", "glD", gitlab.toggle_draft_mode)
  --   end,
  -- },
  {
    "jinh0/eyeliner.nvim",
    lazy = false,
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true, -- show highlights only after keypress
        dim = true, -- dim all other characters if set to true (recommended!)
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    config = function()
      -- require("img-clip").setup {
      --   -- use recommended settings from above
      --   embed_image_as_base64 = false,
      --   prompt_for_file_name = false,
      --   drag_and_drop = {
      --     insert_mode = true,
      --   },
      --   -- required for Windows users
      --   use_absolute_path = true,
      -- }
      require("avante_lib").load()
      require("avante").setup {
        provider = "ollama",
        vendors = {
          ---@type AvanteProvider
          ollama = {
            ["local"] = true,
            endpoint = "127.0.0.1:11434/v1",
            model = "llama3.1",
            parse_curl_args = function(opts, code_opts)
              return {
                url = opts.endpoint .. "/chat/completions",
                headers = {
                  ["Accept"] = "application/json",
                  ["Content-Type"] = "application/json",
                },
                body = {
                  model = opts.model,
                  messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
                  max_tokens = 2048,
                  stream = true,
                },
              }
            end,
            parse_response_data = function(data_stream, event_state, opts)
              require("avante.providers").openai.parse_response(data_stream, event_state, opts)
            end,
          },
        },
      }
    end, -- Override to setup mason-lspconfig

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
}

return plugins
