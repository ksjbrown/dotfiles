return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			border = "rounded",
		},
		spec = {
			{ "<leader>b", group = "Buffers..." },
			{ "<leader>c", group = "Code..." },
			{ "<leader>d", group = "Debug..." },
			{ "<leader>f", group = "Find..." },
			{ "<leader>g", group = "Git..." },
			{ "<leader>n", group = "Notifications..." },
			{ "<leader>p", group = "Persistence..." },
			{ "<leader>u", group = "UI..." },
			{ "<leader>t", group = "Test..." },
			{ "<leader>w", group = "Windows..." },
		},
	},
}
