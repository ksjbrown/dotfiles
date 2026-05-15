require("lspconfig")
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
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
vim.lsp.config('basedpyright', {
    handlers = {
        ['$/progress'] = function(err, result, ctx)
            if result.token == (vim.g.basedpyright_progress_token or result.token) then
                vim.g.basedpyright_progress_token = result.token
                vim.lsp.handlers['$/progress'](err, result, ctx)
            end
        end,
    },
})
vim.lsp.config('gopls', {
    settings = {
        gopls = {
            semanticTokens = true,
        }
    }
})
-- highlight readonly vars as constants
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.go", { link = "@constant" })
vim.lsp.enable({
    "angularls",
    "bashls",
    "clangd",
    "gopls",
    "lua_ls",
    "basedpyright",
    "rust_analyzer",
    "ts_ls",
})
