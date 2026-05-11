return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    keys = {
        { "<leader>sa", function() require("codecompanion").toggle({ window_opts = { layout = "float", width = 0.9 } }) end },
        { "<leader>sA", function() require("codecompanion").toggle({ window_opts = { split = "right" } }) end },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
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
