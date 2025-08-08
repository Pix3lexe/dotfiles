return {
  'mbbill/undotree',
  cmd = { 'UndotreeToggle' },
  keys = { {
    '<leader>ut',
    function()
      vim.cmd 'UndotreeToggle'
    end,
    desc = '[U]ndotree [t]oggle',
  } },
}
