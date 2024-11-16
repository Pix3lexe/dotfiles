require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>md", function()
	vim.cmd("MarkdownPreview")
end, { desc = "Preview Markdown file", silent = true })

map("n", "<leader>bp", function()
	vim.cmd("DapToggleBreakpoint")
end, { desc = "Toggle breakpoint", silent = true })

map("n", "<leader>dr", function()
	vim.cmd("DapContinue")
end, { desc = "Start or continue the debugger", silent = true })

map("n", "<leader>lr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "See references to word under cursor in telescope", silent = true })

map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "n", "nzzzv", { noremap = true, silent = true })
map("n", "N", "Nzzzv", { noremap = true, silent = true })

map("n", "<leader>ti", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints", silent = true })
