return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
  keys = {
    {
      '<leader>mp',
      function()
        vim.cmd 'MarkdownPreviewToggle'
      end,
      desc = '[M]arkdown [P]review',
    },
  },
}
