return {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-dap",
        -- adapters
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-go",
    },
    config = function(_, opts)
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-go")({})
            },
        })
    end,
    keys = {
        { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,                    desc = "Debug" },
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "File" },
        { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end,                            desc = "All Files" },
        { "<leader>tt", function() require("neotest").run.run() end,                                        desc = "Nearest" },
        { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Last" },
        { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Summary" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Output" },
        { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Output Panel" },
        { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop" },
        { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "Watch" },
    },
}
