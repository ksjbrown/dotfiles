-- All
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
    float = { border = "rounded" },
    jump = {
        on_jump = function(diagnostic, _)
            if not diagnostic then return end
            vim.diagnostic.open_float()
        end,
    },
})
vim.lsp.config('*', { capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } } })

-- C++
vim.lsp.config("neocmake", {
    init_options = {
        lint = true,
    },
})
vim.keymap.set("n", "<leader>cs", "<Cmd>LspClangdSwitchSourceHeader<CR>", { desc = "(C++) Switch Source/Header" } )
vim.lsp.enable({ "clangd", "neocmake" })

-- Go
vim.lsp.config('gopls', {
    settings = {
        gopls = {
            semanticTokens = true,
        }
    }
})
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.go", { link = "@constant" })
vim.lsp.enable({ "gopls" })

-- Lua
vim.lsp.enable({ "lua_ls" })

-- Python
vim.lsp.config('basedpyright', {
    handlers = {
        -- workaround for lsp progress message spam
        ['$/progress'] = function(err, result, ctx)
            if result.token == (vim.g.basedpyright_progress_token or result.token) then
                vim.g.basedpyright_progress_token = result.token
                vim.lsp.handlers['$/progress'](err, result, ctx)
            end
        end,
    },
})
vim.lsp.enable({ "basedpyright" })

-- Web
vim.lsp.enable({ "angularls", "ts_ls" })
