return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  dependencies = {
    { 'rafamadriz/friendly-snippets' }, -- snippet sources
  },
  opts = {
    appearance = {
      nerd_font_variant = 'mono',
      use_nvim_cmp_as_default = false,
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        draw = { treesitter = { 'lsp' } },
      },
      ghost_text = { enabled = false },
    },
    keymap = {
      preset = 'default',
      ['<C-n>'] = { 'select_next' },
      ['<C-p>'] = { 'select_prev' },
      ['<C-y>'] = { 'accept' },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
    cmdline = { enabled = false },
    signature = { enabled = true },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  config = function(_, opts)
    require('blink.cmp').setup(opts)
  end,
}
