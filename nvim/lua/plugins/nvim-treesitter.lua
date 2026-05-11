return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
    branch = "main",
	build = function()
        vim.cmd(":TSUpdate")
    end,
	config = function(_, opts)
        local langs = {
			"c",
			"cpp",
			"gitcommit",
			"java",
			"json",
			"lua",
			"markdown",
			"go",
			"python",
			"rust",
		}
		require("nvim-treesitter").setup(opts)
		require("nvim-treesitter").install(langs)
        for _, lang in ipairs(langs) do
            vim.api.nvim_create_autocmd("FileType", {
                pattern = lang,
                callback = function()
                    vim.treesitter.start()
                    vim.opt_local.foldmethod = "expr"
                    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.opt_local.foldlevel = 99
                end,
            })
        end
	end,
}
