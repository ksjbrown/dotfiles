-- https://cmp.saghen.dev/
return {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        cmdline = {
            enabled = true,
            keymap = { preset = 'inherit' },
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
                winhighlight =
                "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            },
        },
        fuzzy = {
            implementation = "rust",
            max_typos = 0,
            sorts = {
                'exact',
                'score',
                'sort_text'
            },
        },
        keymap = {
            preset = "default",
            ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
            ["<Enter>"] = { "snippet_forward", "fallback" },
            ["<S-Enter>"] = { "snippet_backward", "fallback" },
            ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" }
        },
        signature = {
            enabled = true,
            window = {
                show_documentation = false,
            }
        },
        snippets = {
            preset = "default",
        },
        sources = {
            providers = {
                snippets = {
                    opts = {
                        friendly_snippets = true,
                    }
                }
            }
        }
    },
    build = "cargo build --release",
}
