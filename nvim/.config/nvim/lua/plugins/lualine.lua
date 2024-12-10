return { -- Statusline
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree', 'packer' },
      },
      sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          function()
            local clients = vim.lsp.get_clients()
            if #clients > 0 then
              return ' ' .. clients[1].name -- Show the first active LSP server's name
            else
              return '' -- If no LSP is active
            end
          end,
          'encoding',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
