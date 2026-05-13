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
            vim.api.nvim_set_hl(0, 'YellowBack', { bg = cp.surface2 })
            vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'RedCursor', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '', texthl = 'YellowCursor', linehl = 'YellowBack', numhl = '' })
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
        opts = {
            winbar = {
                show = true,
                sections = { "repl", "console", "scopes", "breakpoints", "watches", "exceptions", "threads", },
                default_section = "scopes",
                custom_sections = {},
                controls = {
                    enabled = true,
                    position = "right",
                    buttons = {
                        "play",
                        "step_into",
                        "step_over",
                        "step_out",
                        "step_back",
                        "run_last",
                        "terminate",
                        "disconnect",
                    },
                    custom_buttons = {},
                },
            },
            icons = {
                disabled = "",
                disconnect = "",
                enabled = "",
                filter = "󰈲",
                negate = " ",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = "",
            },
            auto_toggle = false,
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
