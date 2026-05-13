return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "igorlfs/nvim-dap-view",
        },
        config = function()
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = ""})
            vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
            vim.fn.sign_define('DapStopped', { text = '', texthl = "DapStopped", linehl="DapStoppedLine" })
        end,
        keys = {
            { "<F3>",       function() require("dap-view").toggle() end, desc = "View" },
            { "<F5>",       function() require("dap").continue() end, desc = "Run/Continue" },
            { "<F6>",       function() require("dap").step_over() end, desc = "Step Over" },
            { "<F7>",       function() require("dap").step_into() end, desc = "Step Into" },
            { "<F8>",       function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dB", function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoint" },
            { "<leader>dc", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
            { "<leader>dh", "<Cmd>DapViewVirtualTextToggle<CR>", desc = "Add to Watch" },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
            { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dr", function() require("dap").continue() end, desc = "Run/Continue" },
            { "<leader>ds", function() require("dap").step_over() end, desc = "Step Over" },
            { "<leader>dw", "<Cmd>DapViewWatch<CR>", mode = {"n", "v"}, desc = "Add to Watch" },
            { "<leader>dv", function() require("dap-view").toggle() end, desc = "View" },
            { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
        },
    },
    {
        "igorlfs/nvim-dap-view",
        keys = {
        },
        opts = {
            winbar = {
                show = true,
                sections = { "breakpoints", "console", "exceptions", "scopes", "threads", "watches", },
                default_section = "scopes",
                controls = {
                    enabled = true,
                    position = "right",
                    buttons = {
                        "play",
                        "step_into",
                        "step_over",
                        "step_out",
                        "terminate",
                    },
                },
            },
            icons = {
                play = "",
                pause = "",
                step_into = "",
                step_over = "",
                step_out = "",
                terminate = "",
            },
            auto_toggle = false,
        },
    },
    -- adapters
    {
        "mfussenegger/nvim-dap-python",
        ft = { "python" },
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dap-python").setup("python3")
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = { "go" },
        dependencies = { "mfussenegger/nvim-dap" },
    },
}
