return { -- Terminal inside nvim
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20, -- Default terminal size
      hide_numbers = true, -- Hide line numbers in the terminal
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = 'horizontal', -- Other options: 'vertical', 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 3,
      },
    }

    vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true, silent = true, desc = '[T]oggle [T]erminal' })
  end,
}
