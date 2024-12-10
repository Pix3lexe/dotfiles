return { -- Take cool code screenshots
  'mistricky/codesnap.nvim',
  build = 'make',
  keys = {
    {
      '<leader>cc',
      '<Esc><cmd>CodeSnap<cr>',
      mode = 'x',
      desc = 'Save selected code snapshot into clipboard',
    },
    {
      '<leader>cs',
      '<Esc><cmd>CodeSnapSave<cr>',
      mode = 'x',
      desc = 'Save selected code snapshot in ~/Pictures',
    },
  },
  opts = {
    bg_theme = 'grape',
    watermark = 'Pix3lexe',
    has_breadcrumbs = true,
  },
}
