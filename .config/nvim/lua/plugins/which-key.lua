return {
	"folke/which-key.nvim",
    keys = {
        { "<F1>", "<Cmd>WhichKey<CR>", desc = "Which-Key" },
    },
	opts = {
		preset = "helix",
		win = {
			border = "rounded",
		},
        triggers = {},
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
