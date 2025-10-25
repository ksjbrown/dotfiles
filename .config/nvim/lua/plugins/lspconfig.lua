return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function(_, opts)
		-- lazy has already downloaded presets by now
		-- override below with desired options
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
		local servers = {
			-- "basedpyright",
			"clangd",
            -- "jedi_language_server",
			"gopls",
			"lua_ls",
			"marksman",
			"ruff",
			"rust_analyzer",
			"pyright",
		}
		vim.lsp.enable(servers)
	end,
}

