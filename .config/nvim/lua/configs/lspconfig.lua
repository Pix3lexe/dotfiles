-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities.offsetEncoding = "utf-16"

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			local opts = {
				on_attach = on_attach,
				on_init = on_init,
				capabilities = capabilities,
			}
			-- Add Lua-specific settings here
			if server_name == "lua_ls" then
				opts.settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Add 'vim' to globals
						},
					},
				}
			end
			require("lspconfig")[server_name].setup(opts)
		end,
	},
})
