return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "theHamsta/nvim-dap-virtual-text", opts = {} },
            { "igorlfs/nvim-dap-view" },
            { "catppuccin/nvim" }
        },
        config = function(_, opts)
            require("dap")
            local cp = require("catppuccin.palettes").get_palette()
            vim.api.nvim_set_hl(0, 'RedCursor', { fg = cp.red })
            vim.api.nvim_set_hl(0, 'YellowCursor', { fg = cp.yellow })
            vim.api.nvim_set_hl(0, 'YellowBack', { bg = cp.crust })
            vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'RedCursor', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '', texthl = 'YellowCursor', linehl = 'YellowBack', numhl = '' })
            vim.api.nvim_set_hl(0, "DapCurrentLine", { default = true, link = "Visual" })
            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
        end,
        keys = {
            { "<F5>",       function() require("dap").continue() end, desc = "Run/Continue" },
            { "<F6>",       function() require("dap").step_over() end, desc = "Step Over" },
            { "<F7>",       function() require("dap").step_into() end, desc = "Step Into" },
            { "<F8>",       function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
            { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dr", function() require("dap").continue() end, desc = "Run/Continue" },
            { "<leader>ds", function() require("dap").step_over() end, desc = "Step Over" },
            { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
        },
    },
    {
        "igorlfs/nvim-dap-view",
        keys = {
            { "<F4>",       "<Cmd>DapViewToggle<CR>", desc = "View" },
            { "<leader>dw", "<Cmd>DapViewToggle<CR>", desc = "View" },
        },
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = { "python" },
        dependencies = {
            { "mfussenegger/nvim-dap" }
        },
        config = function(_, _)
            require("dap-python").setup("python3")
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = { "go" },
        dependencies = {
            { "mfussenegger/nvim-dap" }
        },
        config = function(_, opts)
            require("dap-go").setup(opts)
        end
    },
}
