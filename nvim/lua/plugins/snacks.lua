return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    keys = {
        { "<leader><space>", function() require("snacks").picker.smart({focus = "input"}) end,                 desc = "Find" },
        { "<leader>,",       function() require("snacks").picker.buffers() end,               desc = "Buffers" },
        { "<leader>/",       function() require("snacks").picker.grep({focus = "input"}) end,                  desc = "Grep" },
        { "<leader>:",       function() require("snacks").picker.command_history() end,       desc = "Command History" },
        { "<leader>e",       function() require("snacks").explorer() end,                     desc = "Files" },
        { "<leader>E",       function() require("snacks").explorer({ cwd = vim.fs.root(0, ".git" ) or vim.fn.expand("%:p:h") }) end, desc = "Explorer Root" },
        { "<leader>fb",      function() require("snacks").picker.lines() end,                 desc = "Buffer Lines" },
        { "<leader>fc",      function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config"), title = "Config", focus = "input" }) end,              desc = "Config" },
        { "<leader>fC",      function() require("snacks").explorer({ cwd = vim.fn.stdpath("config"), title = "Config" }) end,                  desc = "Config" },
        { "<leader>fd",      function() require("snacks").picker.diagnostics() end,           desc = "Buffer Diagnostics" },
        { "<leader>fD",      function() require("snacks").picker.diagnostics_buffer() end,    desc = "Diagnostics" },
        { "<leader>ff",      function() require("snacks").picker.files() end,                 desc = "Files" },
        { "<leader>fg",      function() require("snacks").picker.git_files() end,             desc = "Find Git Files" },
        { "<leader>fh",      function() require("snacks").picker.help({focus = "input"}) end,                  desc = "Help Pages" },
        { "<leader>fj",      function() require("snacks").picker.jumps() end,                 desc = "Jumps" },
        { "<leader>fk",      function() require("snacks").picker.keymaps({focus = "input"}) end,               desc = "Keymaps" },
        { "<leader>fs",      function() require("snacks").picker.lsp_workspace_symbols({focus = "input"}) end, desc = "LSP Workspace Symbols" },
        { "<leader>fS",      function() require("snacks").picker.lsp_symbols({focus = "input"}) end,           desc = "LSP Symbols" },
        { "<leader>fu",      function() require("snacks").picker.undo() end,                  desc = "Undo History" },
        { "<leader>fw",      function() require("snacks").picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
        { "<leader>gf",      function() require("snacks").picker.git_log_file() end,          desc = "Git Log File" },
        { "<leader>gg",      function() require("snacks").lazygit() end,                      desc = "Lazygit" },
        { "<leader>gl",      function() require("snacks").picker.git_log_line() end,          desc = "Git Log Line" },
        { "<leader>cl",      function() require("snacks").picker.lsp_config() end,            desc = "Goto Definition" },
        { "gd",              function() require("snacks").picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",              function() require("snacks").picker.lsp_declarations() end,      desc = "Goto Declaration" },
        { "gr",              function() require("snacks").picker.lsp_references() end,        nowait = true,                     desc = "References" },
        { "gI",              function() require("snacks").picker.lsp_implementations() end,   desc = "Goto Implementation" },
        { "gy",              function() require("snacks").picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
        { "gai",              function() require("snacks").picker.lsp_incoming_calls() end,  desc = "Goto Incoming Calls" },
        { "gao",              function() require("snacks").picker.lsp_outgoing_calls() end,  desc = "Goto Outgoing Calls" },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        -- toggles
        require("snacks").toggle.indent():map("<leader>ui")
        require("snacks").toggle.line_number():map("<leader>ul")
        require("snacks").toggle.option("expandtab", { name = "Expand Tabs" }):map("<leader>ut")
        require("snacks").toggle.option("relativenumber", { name = "Relative Line Numbers" }):map("<leader>uL")
        require("snacks").toggle.option("wrap", { name = "Word Wrap" }):map("<leader>uw")
        require("snacks").toggle.option("list", { name = "Whitespace" }):map("<leader>us")
        require("snacks").toggle.new({
            name = "Diagnostics (Virtual Text)",
            get = function()
                return vim.diagnostic.config().virtual_text ~= false
            end,
            set = function(state)
                vim.diagnostic.config({ virtual_text = state})
            end
        }):map("<leader>ud")
    end,
    opts = {
        bigfile = {},
        explorer = { replace_netrw = true },
        picker = {
            focus = "list",
            sources = {
                explorer = {
                    auto_close = true,
                    layout = {
                        preset = "default",
                        preview = true,
                    },
                    hidden = true,
                    ignored = true,
                },
            },
        },
        scroll = {
            animate = {
                duration = { step = 10, total = 100 },
                easing = "linear",
            },
        },
        styles = { lazygit = { height = 0, width = 0 } },
        win = { backdrop = false },
    },
}
