return { -- Move as fast as flash ;)
  'folke/flash.nvim',
  event = 'VeryLazy',
  config = function()
    ---@type Flash.Config
    local opts = {
      highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
          match = 'FlashMatch',
          current = 'FlashCurrent',
          backdrop = 'FlashBackdrop',
          label = 'FlashLabel',
        },
      },
    }

    local keys = {
      {
        'f',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'F',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-f>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    }
    require('flash').setup(opts)
    for _, key in ipairs(keys) do
      vim.keymap.set(key.mode, key[1], key[2], { desc = key.desc })
    end
  end,
}
