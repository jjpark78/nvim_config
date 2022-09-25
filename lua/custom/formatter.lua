require('formatter').setup {
  logging = true,
  filetype = {
    html = {{cmd = {"prettier -w"}}},
    typescript = {
      -- prettier
      function()
        return {
          exe = 'prettier',
          args = {
            '--config-precedence',
            'prefer-file',
            '--stdin-filepath',
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end
    },
  }
  -- typescriptreact = {
  --   -- prettier
  --   function()
  --     return {
  --       exe = 'prettier',
  --       args = {
  --         '--config-precedence',
  --         'prefer-file',
  --         '--stdin-filepath',
  --         vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
  --       },
  --       stdin = true,
  --     }
  --   end
  --  },
  --  javascript = {
  --         -- prettier
  --         function()
  --           return {
  --             exe = "prettier",
  --             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
  --             stdin = true
  --           }
  --         end
  --       },
  --  javascriptreact = {
  --         -- prettier
  --         function()
  --           return {
  --             exe = "prettier",
  --             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
  --             stdin = true
  --           }
  --         end
  --       },
  --  json = {
  --         -- prettier
  --         function()
  --           return {
  --             exe = "prettier",
  --             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
  --             stdin = true
  --           }
  --         end
  --       },
  --  -- lua = {
  --  --        -- luafmt
  --  --        function()
  --  --          return {
  --  --            exe = "luafmt",
  --  --            args = {"--indent-count", 2, "--stdin"},
  --  --            stdin = true
  --  --          }
  --  --        end
  --  --      }
}
