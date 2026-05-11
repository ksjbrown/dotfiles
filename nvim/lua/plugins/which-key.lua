-- https://github.com/folke/which-key.nvim
return {
    "folke/which-key.nvim",
    keys = {
        { "<leader>sk", "<Cmd>WhichKey<CR>", desc = "Which-Key" },
        { "<F1>",      "<Cmd>WhichKey<CR>", desc = "Which-Key" },
    },
    event = "VeryLazy",
    opts = {
        preset = "helix",
        win = {
            border = "rounded",
        },
        triggers = {},
        spec = {
            { "<leader>b", group = "Buffers..." },
            { "<leader>c", group = "Code..." },
            { "<leader>d", group = "Debug..." },
            { "<leader>f", group = "Find..." },
            { "<leader>g", group = "Git..." },
            { "<leader>n", group = "Noice..." },
            { "<leader>p", group = "Persistence..." },
            { "<leader>s", group = "Show..." },
            { "<leader>S", group = "Set..." },
            { "<leader>t", group = "Test..." },
            { "<leader>u", group = "UI..." },
            { "<leader>w", group = "Windows..." },
        },
    },
}
