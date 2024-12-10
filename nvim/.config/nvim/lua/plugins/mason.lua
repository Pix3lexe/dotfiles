return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup {
      ui = {
        border = 'rounded', -- Other options: 'none', 'single', 'double', 'shadow'
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
        keymaps = {
          toggle_package_expand = '<CR>',
          install_package = 'i',
          update_package = 'u',
          check_package_version = 'c',
          update_all_packages = 'U',
          check_outdated_packages = 'C',
          uninstall_package = 'X',
          cancel_installation = '<C-c>',
        },
      },
    }
  end,
}
