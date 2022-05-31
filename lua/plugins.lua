vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
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
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'onsails/lspkind.nvim'
  -- use {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup {
  --       log_level = 'info',
  --       auto_session_suppress_dirs = {'~/', '~/develop'}
  --     }
  --   end
  -- }
  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  }
  use { 'numToStr/Comment.nvim' }
  use {
    'kdheepak/lazygit.nvim'
  }
  use {
    'neomake/neomake'
  }
  use {
    'TimUntersberger/neogit', requires='nvim-lua/plenaty.nvim'
  }
end)

-- require('auto-session').setup(require('custom.session'))
require('neogit').setup()
require('custom.lazygit')
require('custom.nvim-cmp')
require('nvim-autopairs').setup()
require('gitsigns').setup()
require('which-key').setup()
require('bufferline').setup()
require("themer").setup({ colorscheme = "dracula" })

require('nvim-lsp-installer').setup()
require('custom.lsp')

require('session-lens').setup({
  prompt_title = 'MY SESSIONS',
  theme_conf = {
    border = true,
    winblend = 0
  },
  previewer = false,
})
require('Comment').setup(require('custom.comment'))
require("telescope").load_extension("themes")
require('telescope').load_extension('projects')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('lazygit')

require("custom.floaterm")
require('custom.lualine')

require('custom.nvimtree')
require('startup').setup(require('custom.dashboard'))
require('project_nvim').setup(require('custom.project'))
