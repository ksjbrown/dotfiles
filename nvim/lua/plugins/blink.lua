-- https://cmp.saghen.dev/
return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"milanglacier/minuet-ai.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			keymap = { preset = "inherit" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = {
				enabled = true,
				show_with_menu = true,
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			menu = {
				auto_show = false,
			},
		},
		fuzzy = {
			implementation = "rust",
			max_typos = 0,
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},
		keymap = {
			preset = "default",
			["<Tab>"] = { "select_next", "accept", "fallback" },
			["<S-Tab>"] = { "select_prev" },
			["<Enter>"] = {
				function(cmp)
					if cmp.is_menu_visible() then
						cmp.accept()
						return true
					end
				end,
				"fallback",
			},
			["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
		},
		signature = {
			enabled = true,
			window = {
				show_documentation = false,
			},
		},
		sources = {
			default = { "lsp", "buffer", "minuet" },
			-- For manual completion only, remove 'minuet' from default
			providers = {
				minuet = {
					name = "minuet",
					module = "minuet.blink",
					async = true,

					-- Should match minuet.config.request_timeout * 1000,
					-- since minuet.config.request_timeout is in seconds
					timeout_ms = 3000,
					score_offset = 50, -- Gives minuet higher priority among suggestions
                    transform_items = function(ctx, items)
                        for _, item in ipairs(items) do
                            item.kind_icon = ''
                            item.kind_name = 'minuet'
                        end
                        return items
                    end
				},
			},
		},
	},
}
