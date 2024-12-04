return function()
  require('catppuccin').setup {
    flavour = 'mocha',
  }
  vim.cmd.colorscheme 'catppuccin'
end
