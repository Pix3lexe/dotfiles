return { -- Collection of small plugins (eg dashboard)
  'folke/snacks.nvim',
  config = function()
    require('snacks').setup {
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          {
            pane = 2,
            section = 'terminal',
            cmd = 'colorscript -e square',
            height = 5,
            padding = 1,
          },
          { section = 'keys', gap = 1, padding = 1 },
          { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          {
            pane = 2,
            icon = ' ',
            title = 'Git Status',
            section = 'terminal',
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = 'hub status --short --branch --renames',
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = 'startup' },
        },
      },
      notifier = {
        enabled = true,
      },
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
  end,
}
