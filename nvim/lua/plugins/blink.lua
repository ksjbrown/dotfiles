-- https://github.com/saghen/blink.cmp
-- https://cmp.saghen.dev/
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
            ["<Esc>"] = {
                function(cmp)
                    if cmp.is_menu_visible() then
                        cmp.hide()
                        return true
                    end
                end,
                "fallback",
            },
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
            ["<C-k>"] = {
                function(cmp)
                    if not cmp.is_menu_visible() then
                        return
                    end
                    if not cmp.is_documentation_visible() then
                        cmp.show_documentation()
                    else
                        cmp.hide_documentation()
                    end
                    return true
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
