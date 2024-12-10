return {
  -- Indent rules
  require 'plugins.vim-sleuth',

  -- Git related stuff
  require 'plugins.gitsigns',

  -- browse keymaps
  require 'plugins.which-key',

  -- fuzzy finder
  require 'plugins.telescope',

  -- LSP Plugins
  require 'plugins.lazydev',
  require 'plugins.luvit-meta',
  require 'plugins.nvim-lspconfig',

  -- Autoformat
  require 'plugins.conform',

  --Autocompletion
  require 'plugins.nvim-cmp',

  -- Best theme ever created ;)
  require 'plugins.catppuccin',

  -- Highlight todo, notes, etc in comments
  require 'plugins.todo-comments',

  -- Collection of various small independent plugins/modules
  require 'plugins.mini',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',

  -- Debugging
  require 'plugins.nvim-dap',

  -- add indentation guides even on blank lines
  require 'plugins.indent-blankline',

  -- Linting
  require 'plugins.nvim-lint',

  -- Flash
  require 'plugins.flash',

  -- File tree view
  require 'plugins.neo-tree',

  -- Automatically add pairs like () or {}
  require 'plugins.nvim-autopairs',

  -- Statusline
  require 'plugins.lualine',

  -- Take cool code screenshots
  require 'plugins.codesnap',

  -- Discord status
  require 'plugins.presence',

  -- Terminal inside nvim
  require 'plugins.toggleterm',

  -- collection of small plugins (eg dashboard)
  require 'plugins.snacks',

  --Edit filesystem like a vim buffer
  require 'plugins.oil',

  --Harpoon (teleport to defined files)
  require 'plugins.harpoon',
}
