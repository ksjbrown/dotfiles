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
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
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
            ["<Tab>"] = { "select_next", "accept", "fallback" },
            ["<S-Tab>"] = { "select_prev" },
            ["<Enter>"] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        cmp.accept()
                        return true
                    end
                end,
                "fallback",
            },
            ["<M-Space>"] = { 
                function(cmp)
                    return cmp.show({ providers = { "buffer" } })
                end,
            },
            ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
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
            default = { "lsp" },
        },
    },
}
