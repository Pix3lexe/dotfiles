return { -- Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    {
      '<leader>st',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = '[S]earch [T]odos',
    },
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
