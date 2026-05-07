return {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        cmdline = {
            enabled = true,
            keymap = { preset = "inherit" },
        },
        completion = {
            ghost_text = {
                enabled = true,
                show_with_menu = true,
            },
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
            menu = {
                auto_show = false,
            },
        },
        fuzzy = {
            implementation = "rust",
            max_typos = 0,
            sorts = {
                "exact",
                "score",
                "sort_text",
            },
        },
        keymap = {
            preset = "default",
            ["<Tab>"] = { "accept", "fallback" },
            ["<Enter>"] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        cmp.accept()
                        return true
                    end
                end,
                "fallback",
            },
        },
        signature = {
            enabled = true,
            window = {
                show_documentation = false,
            },
        },
        sources = {
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
            default = { "lsp", "buffer" },

        },
    },
}
