return function()
  require('snacks').setup {
    toggle = {
      notify = true, -- show notifications when toggling
      which_key = true, -- integrate with which-key
      icon = {
        enabled = ' ', -- custom icon for diagnostics enabled
        disabled = ' ', -- custom icon for diagnostics disabled
      },
      color = {
        enabled = 'green', -- highlight color for diagnostics enabled
        disabled = 'red', -- highlight color for diagnostics disabled
      },
    },
  }

  -- Map a keybind for toggling diagnostics
  require('snacks.toggle').diagnostics():map '<leader>td'
end
