return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>pl", function() require("persistence").load() end,   desc = "Load", },
		{ "<leader>pL", function() require("persistence").select() end, desc = "Select", },
	},
	opts = {},
}
