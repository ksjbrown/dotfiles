local prettier = { "prettierd", "prettier", stop_after_first = true }
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{ "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format", },
	},
	opts = {
		formatters_by_ft = {
            cmake = { "cmake_format" },
            cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = prettier,
			typescript = prettier,
			html = prettier,
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters = {
            cmake_format = {
                command = "cmake-format",
                args = { "$FILENAME" },
            },
        },
    },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
