return {
	"milanglacier/minuet-ai.nvim",
	opts = {
		provider = "openai_compatible",
        context_window = 512,
		provider_options = {
			openai_compatible = {
				api_key = "OPENCODE_GO_API_KEY",
				-- https://opencode.ai/docs/zen/#endpoints
				end_point = "https://opencode.ai/zen/v1/chat/completions",
				model = "big-pickle",
				name = "Opencode",
				optional = {
					max_tokens = 256,
					top_p = 0.9,
					-- disable thinking to avoid first token latency
					thinking = { type = "disabled" },
				},
			},
		},
		duet = {
			provider = "openai_compatible",
			provider_options = {
				openai_compatible = {
					api_key = "OPENCODE_GO_API_KEY",
					-- https://opencode.ai/docs/zen/#endpoints
					end_point = "https://opencode.ai/zen/v1/chat/completions",
					model = "big-pickle",
					name = "Opencode",
					optional = {
						max_tokens = 256,
						top_p = 0.9,
						-- disable thinking to avoid first token latency
						thinking = { type = "disabled" },
					},
				},
			},
		},
	},
}
