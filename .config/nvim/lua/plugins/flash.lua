-- https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = true,
                highlight = { backdrop = true, },
            }
        },
        prompt = {
            enabled = false,
        },
    },
    keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
        { "r",     mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
