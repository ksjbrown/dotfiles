vim.diagnostic.config({
    virtual_text = {
        current_line = false,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
    severity_sort = true,
    float = {
        border = "rounded",
        format = function(d)
            return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
        end,
    },
    underline = true,
    jump = {
        float = true,
    },
})
vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { '.git' },
})
vim.lsp.enable({
    "angularls",
    "gopls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "ts_ls",
})
