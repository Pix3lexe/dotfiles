return function()
  local dap = require 'dap'
  local dapui = require 'dapui'

  require('mason-nvim-dap').setup {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_installation = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
      -- Update this to ensure that you have the debuggers for the langs you want
      'codelldb',
    },
  }

  -- Dap UI setup
  -- For more information, see |:help nvim-dap-ui|
  dapui.setup {}

  -- Change breakpoint icons
  -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
  -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
  -- local breakpoint_icons = vim.g.have_nerd_font
  --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
  --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
  -- for type, icon in pairs(breakpoint_icons) do
  --   local tp = 'Dap' .. type
  --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
  --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
  -- end

  dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  dap.listeners.before.event_exited['dapui_config'] = dapui.close

  -- Install golang specific config
  require('dap-go').setup {
    delve = {
      -- On Windows delve must be run attached or it crashes.
      -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
      detached = vim.fn.has 'win32' == 0,
    },
  }
end
