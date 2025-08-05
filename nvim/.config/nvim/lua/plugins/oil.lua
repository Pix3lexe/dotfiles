return { -- Edit filesystem like a vim buffer
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = 'Oil',
  keys = {
    {
      '-',
      function()
        require('oil').open()
      end,
      desc = 'Open parent directory',
    },
  },
  config = function()
    require('oil').setup {}
  end,
}
