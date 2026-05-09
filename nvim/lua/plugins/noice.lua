-- https://github.com/folke/noice.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
        presets = {
            command_palette = true,
            bottom_search = true,
            lsp_doc_border = true,
        },
		lsp = {
			signature = {
				enabled = false,
			},
		},
	},
	keys = {
		{ "<leader>nn", "<Cmd>Noice<CR>", desc = "Show" },
		{ "<leader>na", "<Cmd>NoiceAll<CR>", desc = "Show All" },
		{ "<leader>nd", "<Cmd>NoiceDismiss<CR>", desc = "Dismiss" },
		{ "<leader>nl", "<Cmd>NoiceLast<CR>", desc = "Show Last" },
	},
}
