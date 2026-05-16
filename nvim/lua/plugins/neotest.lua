return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- adapters
        "nvim-neotest/neotest-python",
        "fredrikaverpil/neotest-golang",
        "alfaix/neotest-gtest"
    },
    config = function ()
        ---@diagnostic disable-next-line: missing-fields
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-golang")({
                    go_test_args = require("ksj").options.go_test_args
                }),
                require("neotest-gtest").setup({}),
            },
        })
    end,
    keys = {
        { "<F4>", function() require("neotest").summary.toggle({ enter = true}) end, desc = "Summary" },
        ---@diagnostic disable-next-line: missing-fields
        { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug" },
        { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "File" },
        { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Last" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Output" },
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Nearest" },
        { "<leader>tv", function() require("neotest").summary.toggle({ enter = true}) end, desc = "Summary" },
        { "<leader>tq", function() require("neotest").run.stop() end, desc = "Stop" },
    },
}
