return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    keys = {
        { "<leader>a", function() require("codecompanion").toggle() end },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        display = {
            chat = {
                window = {
                    layout = "float",
                    width = 0.8,
                    height = 0.8,
                    opts = {
                        number = false,
                    },
                },
            },
        },
        interactions = {
            chat = {
                adapter = "opencode",
            },
        },
    },
}
