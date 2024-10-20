local conform = require("conform")

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang-format" }
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        })
    end, { desc = "Format file or range (in visual mode)" })
}

conform.setup(options)
