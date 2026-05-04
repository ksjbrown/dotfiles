-- CodeCompanion adapter configuration using opencode HTTP adapter
return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    keys = {
        { "<leader>aa", "<Cmd>CodeCompanionChat Toggle<CR>", desc = "Which-Key" },
        { "<leader>ac", "<Cmd>CodeCompanion<CR>", desc = "Which-Key" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        adapters = {
            http = {
            opencode_http = function()
                return require("codecompanion.adapters").extend("openai_compatible", {
                    url = "https://opencode.ai/zen/v1/chat/completions",
                    env = {
                        api_key = "OPENCODE_GO_API_KEY",
                    },
                })
            end,
        }
        },
        interactions = {
            chat = {
                adapter = "opencode",
            },
            inline = {
                adapter = "opencode_http",
                -- adapter = {
                --     name = "opencode_http",
                --     model = "big-pickle",
                -- },
            },
        },
    },
}
