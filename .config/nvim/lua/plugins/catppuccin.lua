-- https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		float = {
			transparent = true,
		},
		auto_integrations = true,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		local groups = { "NormalFloat", "Pmenu", "PmenuThumb", "Normal" }
		local function apply_highlights()
			for _, group in ipairs(groups) do
				vim.api.nvim_set_hl(0, group, { bg = "NONE" })
			end
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3b3844" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#6c6783" })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#575268", fg = "#cdd6f4" })
		end
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "catppuccin",
			callback = apply_highlights,
		})
		vim.cmd([[colorscheme catppuccin]])
	end
}
