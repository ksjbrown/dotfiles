return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    keys = {
        { "<leader><space>", function() require("snacks").picker.smart() end,                                   desc = "Find" },
        { "<leader>,",       function() require("snacks").picker.buffers({ focus = "list" }) end,               desc = "Buffers" },
        { "<leader>/",       function() require("snacks").picker.grep() end,                                    desc = "Grep" },
        { "<leader>:",       function() require("snacks").picker.command_history({ focus = "list" }) end,       desc = "Command History" },
        { "<leader>e",       function() require("snacks").explorer() end,                                       desc = "Files" },
        { "<leader>fb",      function() require("snacks").picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>fc",      function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config" },
        { "<leader>fC",      function() require("snacks").explorer({ cwd = vim.fn.stdpath("config") }) end,     desc = "Config" },
        { "<leader>fd",      function() require("snacks").picker.diagnostics({ focus = "list" }) end,           desc = "Buffer Diagnostics" },
        { "<leader>fD",      function() require("snacks").picker.diagnostics_buffer({ focus = "list" }) end,    desc = "Diagnostics" },
        { "<leader>ff",      function() require("snacks").picker.files() end,                                   desc = "Files" },
        { "<leader>fg",      function() require("snacks").picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fh",      function() require("snacks").picker.help() end,                                    desc = "Help Pages" },
        { "<leader>fj",      function() require("snacks").picker.jumps({ focus = "list" }) end,                 desc = "Jumps" },
        { "<leader>fk",      function() require("snacks").picker.keymaps() end,                                 desc = "Keymaps" },
        { "<leader>fs",      function() require("snacks").picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
        { "<leader>fS",      function() require("snacks").picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>fu",      function() require("snacks").picker.undo({ focus = "list" }) end,                  desc = "Undo History" },
        { "<leader>fw",      function() require("snacks").picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
        { "<leader>gf",      function() require("snacks").picker.git_log_file({ focus = "list" }) end,          desc = "Git Log File" },
        { "<leader>gg",      function() require("snacks").lazygit({ layout = { height = 0, width = 0 } }) end,  desc = "Lazygit" },
        { "<leader>gl",      function() require("snacks").picker.git_log_line({ focus = "list" }) end,          desc = "Git Log Line" },
        -- LSP
        { "<leader>cl",      function() require("snacks").picker.lsp_config({ focus = "list" }) end,            desc = "Goto Definition" },
        { "gd",              function() require("snacks").picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",              function() require("snacks").picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",              function() require("snacks").picker.lsp_references() end,                          nowait = true,                     desc = "References" },
        { "gi",              function() require("snacks").picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gt",              function() require("snacks").picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        -- toggles
        require("snacks").toggle.diagnostics():map("<leader>ud")
        require("snacks").toggle.indent():map("<leader>ui")
        require("snacks").toggle.line_number():map("<leader>ul")
        require("snacks").toggle.option("expandtab", { name = "Expand Tabs" }):map("<leader>ut")
        require("snacks").toggle.option("relativenumber", { name = "Relative Line Numbers" }):map("<leader>uL")
        require("snacks").toggle.option("wrap", { name = "Word Wrap" }):map("<leader>uw")
        require("snacks").toggle.option("list", { name = "Whitespace" }):map("<leader>us")
    end,
    opts = {
        bigfile = {},
        explorer = { replace_netrw = true },
        picker = {
            sources = {
                explorer = {
                    auto_close = true,
                    layout = {
                        preset = "default",
                        preview = true,
                    },
                },
            },
        },
        scroll = {},
        styles = { lazygit = { height = 0, width = 0 } },
        win = { backdrop = false },
    },
}
