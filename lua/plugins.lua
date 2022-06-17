vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }

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
  use {
    'christoomey/vim-tmux-navigator'
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
  use { 'numToStr/Comment.nvim' }
  use {
    'kdheepak/lazygit.nvim'
  }
  use {
    'neomake/neomake'
  }
  use {
    'tanvirtin/vgit.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    "klen/nvim-config-local"
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
  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }
  use {
    "mg979/vim-visual-multi", { branch = "master" }
  }
  use {
    "ojroques/vim-oscyank", {branch = "master"}
  }
end)

require('custom.lazygit')
require('custom.vgit')
require('custom.nvim-cmp')
require('nvim-autopairs').setup()
require('gitsigns').setup()
require('which-key').setup()
require('bufferline').setup()
require("themer").setup({ colorscheme = "dracula" })

require('nvim-lsp-installer').setup()
require('custom.lsp')
require('config-local').setup()
require('custom.trouble-setting')
require('Comment').setup(require('custom.comment'))
require("telescope").setup({
  extensions = {
    projects = {
      hidden_files = true,
    },
  },
})
require("telescope").load_extension("themes")
require('telescope').load_extension('projects')
require('telescope').load_extension('lazygit')

require("custom.floaterm")
require('custom.lualine')

require('custom.nvimtree')
require('startup').setup(require('custom.dashboard'))
require('project_nvim').setup(require('custom.project'))
