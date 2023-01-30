require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    -- Currently, only the round theme exists
    theme = "round",
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "double",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "🐞",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
  code_action = {
    num_shortcut = true,
    keys = {
      quit = "<esc>",
      exec = "<CR>",
    },
  },
  finder = {
    quit = { "q", "<ESC>" }
  },
  rename = {
    quit = "<ESC>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
})
