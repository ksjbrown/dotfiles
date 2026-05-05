return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    keys = {
        { "<leader>a", function() require("codecompanion").toggle({ window_opts = { layout = "float", width = 0.8, height = 0.8 } }) end },
        { "<leader>A", function() require("codecompanion").toggle({ window_opts = { split = "right", width = 0.33, } }) end },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        display = {
            chat = {
                window = {
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
