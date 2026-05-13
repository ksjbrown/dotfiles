-- https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme "catppuccin-nvim"
	end,
    opts = {
        auto_integrations = true,
        no_italic = true,
        custom_highlights = function(colors)
            return {
                DapBreakpoint = { fg = colors.red },
                DapBreakpointCondition = { fg = colors.red },
                DapStopped = { fg = colors.sapphire },
                DapStoppedLine = { bg = colors.surface1 },
                MiniTrailspace =  { bg = colors.surface2 },
            }
        end
    },
}
