local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
capabilities.offsetEncoding = "utf-16"

local on_attach = function(client, bufnr)
	-- Disable clangd's formatting capabilities
	if client.name == "clangd" then
		client.server_capabilities.documentFormattingProvider = false
	end
	-- Call the original on_attach function if it exists
	require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end

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
