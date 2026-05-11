require("lspconfig")
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
    },
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
})
vim.lsp.enable({
    "angularls",
    "bashls",
    "clangd",
    "gopls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "ts_ls",
})
