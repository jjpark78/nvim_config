require("neotest").setup({
  -- discovery = { enabled = true },
  -- adapters = {
  --   require("neotest-jest")({
  --     jestCommand = "yarn test --",
  --     -- jestConfigFile = "custom.jest.config.ts",
  --     env = { CI = true },
  --     cwd = function(path)
  --       return vim.fn.getcwd()
  --     end,
  --   }),
  --   -- require("neotest-plenary"),
  --   -- require("neotest-vim-test")({
  --   --   ignore_file_types = { "python", "vim", "lua" },
  --   -- }),
  -- },
})

require("neotest").setup_project('/Users/jaejinpark/Development/harrie/nest/backends', {
  discovery = { enabled = false },
  adapters = {
    require("neotest-jest")({
      jestCommand = "yarn test",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  },
})
