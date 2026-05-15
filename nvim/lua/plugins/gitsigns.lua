return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	keys = {
		{ "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", mode = { "n", "v" } },
		{ "<leader>gw", "<Cmd>Gitsigns toggle_word_diff<CR>", mode = { "n", "v" } },
	},
	opts = {
		attach_to_untracked = true,
        current_line_blame_opts = {
            delay = 0,
        },
	},
}
