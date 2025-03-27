return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'zathura'

    vim.g.vimtex_view_forward_search_on_start = 0
    vim.g.vimtex_view_follow = 1
    vim.g.vimtex_syntax_enabled = 0
  end,
}
