return { -- Harpoon (teleport to defined files)
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[H]arpoon [A]dd',
    },
    {
      '<leader>he',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = '[H]arpoon [E]xplore list',
    },
    {
      '<leader>h1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = '[H]arpoon [1] element',
    },
    {
      '<leader>h2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = '[H]arpoon [2] element',
    },
    {
      '<leader>h3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = '[H]arpoon [3] element',
    },
    {
      '<leader>h4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = '[H]arpoon [4] element',
    },
    {
      '<leader>hp',
      function()
        require('harpoon'):list():prev()
      end,
      desc = '[H]arpoon previous element',
    },
    {
      '<leader>hn',
      function()
        require('harpoon'):list():next()
      end,
      desc = '[H]arpoon next element',
    },
  },
}
