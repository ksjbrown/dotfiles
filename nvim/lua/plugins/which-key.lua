return {
	"folke/which-key.nvim",
    keys = {
        { "<F1>", "<Cmd>WhichKey<CR>", desc = "Which-Key" },
    },
    event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			border = "rounded",
		},
        triggers = {},
		spec = {},
	},
}
