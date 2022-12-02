vim.cmd [[packadd packer.nvim]]

require("packer").startup(
  function()
    use "wbthomason/packer.nvim"
    use "christoomey/vim-tmux-navigator"

    -- neomake & test & qf
    use "neomake/neomake"
    use "ekickx/clipboard-image.nvim"
    use "APZelos/blamer.nvim"
    use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}
    use {
      "w0rp/ale",
      ft = {"sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex"},
      cmd = "ALEEnable",
      config = "vim.cmd[[ALEEnable]]"
    }
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview", ft = "markdown"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {"akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons"}
    use "folke/which-key.nvim"
    -- use "mhartington/formatter.nvim"
    use "tpope/vim-surround"
    use "easymotion/vim-easymotion"
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}}
    use "themercorp/themer.lua"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use {"mhartington/formatter.nvim"}
    -- use "williamboman/nvim-lsp-installer"
    use "voldikss/vim-floaterm"
    use "nvim-lua/plenary.nvim"
    use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    }
    use "mg979/vim-visual-multi"
    use "nvim-lua/popup.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/gitsigns.nvim"
    use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"}
    use "windwp/nvim-autopairs"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use {"tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp"}
    use "onsails/lspkind.nvim"
    use "brglng/vim-im-select"
    -- use {
    --   'rmagatti/auto-session',
    --   config = function()
    --     require('auto-session').setup {
    --       log_level = 'info',
    --       auto_session_suppress_dirs = { '~/', '~/develop' }
    --     }
    --   end
    -- }
    -- use {
    --   'rmagatti/session-lens',
    --   requires = { 'nvim-telescope/telescope.nvim' },
    -- }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup(require("custom.comment"))
      end
    }
    use {
      ""
    }
    use {
      "kdheepak/lazygit.nvim"
    }
    use {
      "hrsh7th/vim-vsnip",
      after = "nvim-cmp"
    }
    use {
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
        local saga = require("lspsaga")
        saga.init_lsp_saga(
          {
            border_style = "single",
            saga_winblend = 0,
            move_in_saga = {prev = "<C-p>", next = "<C-n>"},
            diagnostic_header = {" ", " ", " ", "ﴞ "},
            -- show_diagnostic_source = true,
            -- diagnostic_source_bracket = {},
            max_preview_lines = 10,
            code_action_icon = "💡",
            code_action_num_shortcut = true,
            code_action_lightbulb = {
              enable = true,
              sign = true,
              enable_in_insert = true,
              sign_priority = 20,
              virtual_text = true
            },
            finder_icons = {
              def = "  ",
              ref = "諭 ",
              link = "  "
            },
            finder_request_timeout = 1500,
            finder_action_keys = {
              open = "o",
              vsplit = "s",
              split = "i",
              tabe = "t",
              quit = "q",
              scroll_down = "<C-f>",
              scroll_up = "<C-b>" -- quit can be a table
            },
            code_action_keys = {
              quit = "q",
              exec = "<CR>"
            },
            rename_action_quit = "<C-c>",
            rename_in_select = true,
            -- definition_preview_icon = "  ",
            symbol_in_winbar = {
              in_custom = false,
              enable = false,
              separator = " ",
              show_file = true,
              click_support = false
            },
            show_outline = {
              win_position = "right",
              --set special filetype win that outline window split.like NvimTree neotree
              -- defx, db_ui
              win_with = "",
              win_width = 30,
              auto_enter = true,
              auto_preview = true,
              virt_text = "┃",
              jump_key = "o",
              adsfuto_refresh = true
            }
          }
        )
      end
    }
  end
)

-- require('auto-session').setup(require('custom.session'))
require("mason").setup()
require("mason-lspconfig").setup()
require("custom.lazygit")
require("custom.diffview")
require("nvim-autopairs").setup()
require("gitsigns").setup()
require("which-key").setup()
require("bufferline").setup()
require("themer").setup({colorscheme = "tokyodark"})
require("custom.clipbard-image")
require("custom.lsp")
require("custom.nvim-cmp")
require("custom.telescope")
require("custom.multiedit")
require("custom.formatter")
require("custom.floaterm")
require("custom.lualine")

require("custom.nvimtree")
require("startup").setup(require("custom.dashboard"))
require("project_nvim").setup(require("custom.project"))
