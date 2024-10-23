local conform = require("conform")

conform.formatters["clang-format-14"] = {
    command = "clang-format-14",
}

local function get_cpp_formatter()
    local cwd = vim.loop.cwd()

    if cwd:match("petrack") then
        return "clang-format-14"
    else
        return "clang-format"
    end
end

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        cpp = { get_cpp_formatter() }
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
