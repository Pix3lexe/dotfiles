return { -- Automatically add pairs like () or {}
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup {}
  end,
}
