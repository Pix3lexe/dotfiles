return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"luadoc",
				"printf",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"python",
				"markdown",
				"json",
				"css",
				"html",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile", "BufWritePre" },
		-- event = 'BufWritePre', -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{ "github/copilot.vim", lazy = true },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{ "nvim-neotest/nvim-nio" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			highlight = {
				backdrop = true,
				matches = true,
				priority = 5000,
				groups = {
					match = "FlashMatch",
					current = "FlashCurrent",
					backdrop = "FlashBackdrop",
					label = "FlashLabel", -- Use default label group
				},
			},
		},
		config = function()
			local colors = dofile(vim.g.base46_cache .. "colors")
			vim.api.nvim_set_hl(0, "FlashLabel", { fg = colors.grey, bg = colors.red })
		end,
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{
				"<leader>cc",
				"<Esc><cmd>CodeSnap<cr>",
				mode = "x",
				desc = "Save selected code snapshot into clipboard",
			},
		},
		opts = {
			bg_theme = "grape",
			watermark = "Pix3lexe",
			has_breadcrumbs = true,
		},
	},
	{
		"andweeb/presence.nvim",
		lazy = false,
		config = function()
			require("presence").setup({
				-- General options
				auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
				main_image = "neovim", -- Main image display (either "neovim" or "file")
				client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
				log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = false, -- Displays the current line number instead of the current project
				blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time = true, -- Show the timer

				-- Rich Presence text options
				editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	},
}
