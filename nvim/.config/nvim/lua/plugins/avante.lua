return {
  'yetone/avante.nvim',
  build = 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    instructions_file = 'avante.md',
    provider = 'copilot',
    auto_suggestions = false, -- Disable avante auto-suggestions to avoid conflicts with blink.cmp
    behaviour = {
      auto_suggestions = false, -- Make sure auto suggestions are disabled
    },
    input = {
      provider = 'snacks',
    },
    selector = {
      provider = 'snacks',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    'folke/snacks.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { 'markdown', 'Avante' } },
      ft = { 'markdown', 'Avante' },
    },
  },
}
