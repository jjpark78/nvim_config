vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
  -- use {
  --   'w0rp/ale',
  --   ft = { 'sh', 'zsh', 'bash', 'vim', 'tex' },
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use 'folke/which-key.nvim'
  use 'tpope/vim-surround'
  use 'easymotion/vim-easymotion'
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use 'themercorp/themer.lua'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'voldikss/vim-floaterm'
  use 'nvim-lua/plenary.nvim'
  use {
    'startup-nvim/startup.nvim',
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }
  use 'nvim-lua/popup.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  use 'onsails/lspkind.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(require('custom.comment'))
    end
  }
  use {
    'kdheepak/lazygit.nvim'
  }
  use {
    'neomake/neomake'
  }
  use {
    "klen/nvim-config-local",
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        auto_preview = false
      }
    end
  }
end)

-- require('auto-session').setup(require('custom.session'))
require('config-local').setup {
  -- Default configuration (optional)
  config_files = { ".vimrc.lua", ".vimrc" },  -- Config file patterns to load (lua supported)
  hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  autocommands_create = true,                 -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true,                     -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
  silent = false,                             -- Disable plugin messages (Config loaded/ignored)
  lookup_parents = false,                     -- Lookup config files in parent directories
}
require('custom.lazygit')
require('custom.nvim-cmp')
require('custom.trouble')
require('nvim-autopairs').setup()
require('gitsigns').setup()
require('which-key').setup()
require('bufferline').setup()
require("themer").setup({ colorscheme = "dracula" })

require('nvim-lsp-installer').setup()
require('custom.lsp')

require("telescope").load_extension("themes")
require('telescope').load_extension('projects')
require('telescope').load_extension('lazygit')

require("custom.floaterm")
require('custom.lualine')

require('custom.nvimtree')
require('startup').setup(require('custom.dashboard'))
require('project_nvim').setup(require('custom.project'))
