vim.cmd [[packadd packer.nvim]]

require("packer").startup(
  function()
    use "wbthomason/packer.nvim"
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-fugitive"
    use "mbbill/undotree"
    -- neomake & test & qf
    use "ekickx/clipboard-image.nvim"
    use "APZelos/blamer.nvim"
    use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
    use {
      "w0rp/ale",
      ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
      cmd = "ALEEnable",
      config = "vim.cmd[[ALEEnable]]"
    }
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview", ft = "markdown" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } }
    }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use { "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }
    use "folke/which-key.nvim"
    -- use "mhartington/formatter.nvim"
    use "tpope/vim-surround"
    use "easymotion/vim-easymotion"
    use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
    use "themercorp/themer.lua"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use { "mhartington/formatter.nvim" }
    -- use "williamboman/nvim-lsp-installer"
    use "voldikss/vim-floaterm"
    use "nvim-lua/plenary.nvim"
    use {
      "startup-nvim/startup.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use "mg979/vim-visual-multi"
    use "nvim-lua/popup.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/gitsigns.nvim"
    use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
    use "windwp/nvim-autopairs"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }
    use "onsails/lspkind.nvim"
    use "brglng/vim-im-select"
    use "p00f/nvim-ts-rainbow"
    -- use "chentoast/marks.nvim"
    use {
      "klen/nvim-config-local",
      config = function()
        require('config-local').setup {
          -- Default configuration (optional)
          config_files = { ".vimrc" }, -- Config file patterns to load (lua supported)
          hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
          autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
          commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
          silent = false, -- Disable plugin messages (Config loaded/ignored)
          lookup_parents = false, -- Lookup config files in parent directories
        }
      end
    }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup(require("custom.comment"))
      end
    }
    use {
      "kdheepak/lazygit.nvim"
    }
    use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
    use { "rafamadriz/friendly-snippets" }
    use {
      "glepnir/lspsaga.nvim",
      branch = "main",
    }
  end
)

require("mason").setup()
require("mason-lspconfig").setup()
require("custom.lazygit")
require("custom.diffview")
require("nvim-autopairs").setup()
require("nvim-treesitter.configs").setup({
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
})
require("gitsigns").setup()
require("which-key").setup()
require("bufferline").setup()
require("themer").setup({ colorscheme = "tokyodark" })
require("custom.clipbard-image")
require("custom.lsp")
require("custom.saga")
require("custom.nvim-cmp")
require("custom.telescope")
require("custom.multiedit")
require("custom.formatter")
require("custom.floaterm")
require("custom.lualine")
require("custom.luasnip")
require("custom.nvimtree")
-- require("custom.neotest")
require("startup").setup(require("custom.dashboard"))
require("project_nvim").setup(require("custom.project"))
-- require("custom.marks")
-- require("custom.session")
