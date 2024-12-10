return { -- Best theme ever created ;)
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
