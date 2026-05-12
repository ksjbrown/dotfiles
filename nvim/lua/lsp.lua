require("lspconfig")
vim.diagnostic.config({
    virtual_text = true,
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
        on_jump = function(diagnostic, _)
            if not diagnostic then return end
            vim.diagnostic.open_float()
        end,
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
