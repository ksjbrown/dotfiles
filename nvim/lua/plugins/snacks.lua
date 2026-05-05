return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    keys = {
        { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Find" },
        { "<leader>,",       function() Snacks.picker.buffers({ focus = "list" }) end,               desc = "Buffers" },
        { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>:",       function() Snacks.picker.command_history({ focus = "list" }) end,       desc = "Command History" },
        { "<leader>C",       function() Snacks.explorer({ cwd = vim.fn.stdpath("config") }) end,     desc = "Config" },
        { "<leader>e",       function() Snacks.explorer() end,                                       desc = "Files" },
        { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config" },
        { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Files" },
        { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fr",      function() Snacks.picker.recent({ focus = "list" }) end,                desc = "Recent Files" },
        { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        { "<leader>gf",      function() Snacks.picker.git_log_file({ focus = "list" }) end,          desc = "Git Log File" },
        { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
        { "<leader>gl",      function() Snacks.picker.git_log({ focus = "list" }) end,               desc = "Git Log" },
        { "<leader>gL",      function() Snacks.picker.git_log_line({ focus = "list" }) end,          desc = "Git Log Line" },
        { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
        { "<leader>sd",      function() Snacks.picker.diagnostics_buffer({ focus = "list" }) end,    desc = "Buffer Diagnostics" },
        { "<leader>sD",      function() Snacks.picker.diagnostics({ focus = "list" }) end,           desc = "Diagnostics" },
        { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
        { "<leader>sj",      function() Snacks.picker.jumps({ focus = "list" }) end,                 desc = "Jumps" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
        { "<leader>su",      function() Snacks.picker.undo({ focus = "list" }) end,                  desc = "Undo History" },
        { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
        { "<leader>uz",      function() Snacks.zen.zoom() end,                                       desc = "Zoom" },
        { "<leader>cl",      function() Snacks.picker.lsp_config({ focus = "list" }) end,            desc = "Goto Definition" },
        { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
        { "gi",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gt",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    },
    config = function(_, opts)
        local Snacks = require("snacks")
        Snacks.setup(opts)
        Snacks.toggle.animate():map("<leader>uA")
        Snacks.toggle.diagnostics():map("<leader>uD")
        Snacks.toggle.dim():map("<leader>uf")
        Snacks.toggle.indent():map("<leader>ui")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>uS")
        Snacks.toggle.option("expandtab", { name = "Tab" }):map("<leader>ut")
        Snacks.toggle.option("relativenumber", { name = "Relative Line Numbers" }):map("<leader>uL")
        Snacks.toggle.option("wrap", { name = "Word Wrap" }):map("<leader>uw")
        Snacks.toggle.option("list", { name = "Whitespace" }):map("<leader>uW")
        Snacks.toggle.new({
            name = "Diagnostics (Current Line)",
            get = function()
                return vim.diagnostic.config().virtual_text.current_line
            end,
            set = function(state)
                vim.diagnostic.config({
                    virtual_text = { current_line = state },
                })
            end,
        }):map("<leader>ud")
        Snacks.toggle.new({
            name = "Statusline - Progress",
            get = function()
                return require("ksj").lualine.progress
            end,
            set = function(state)
                require("ksj").lualine.progress = state
            end,
        }):map("<leader>up")
        -- prevent flashing in blink.cmp
        local group = vim.api.nvim_create_augroup("snacks_blink_compat", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "BlinkCmpMenuOpen",
            callback = Snacks.scroll.disable,
        })
        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "BlinkCmpMenuClose",
            callback = Snacks.scroll.enable,
        })
    end,
    opts = {
        bigfile = {},
        explorer = { replace_netrw = true },
        lazygit = {},
        picker = {
            sources = {
                explorer = {
                    auto_close = true,
                    layout = { preset = "default", preview = true },
                    hidden = true,
                },
            },
        },
        scroll = {},
        styles = {
            lazygit = { height = 0, width = 0 },
        },
        words = {},
    },
}
