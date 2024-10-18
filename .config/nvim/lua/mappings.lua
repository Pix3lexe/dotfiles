require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ll", function()
    require("nvchad.tabufline").next()
end, { desc = "Next buffer", silent = true })

map("n", "<leader>hh", function()
    require("nvchad.tabufline").prev()
end, { desc = "Previous buffer", silent = true })

map("n", "<leader>md", function()
    vim.cmd("MarkdownPreview")
end, { desc = "Preview Markdown file", silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
