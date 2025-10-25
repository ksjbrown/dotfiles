require("bootstrap")
require("options")
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
	defaults = {
		lazy = true,
	},
	ui = {
		border = "rounded",
	},
})
require("keymaps")
