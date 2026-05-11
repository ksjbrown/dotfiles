-- https://github.com/folke/noice.nvim
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        presets = {
            command_palette = true,
            bottom_search = true,
            lsp_doc_border = true,
        },
        cmdline = {
            view = "cmdline",
            format = {
                input = {
                    view = "cmdline",
                },
            },
        },
        lsp = {
            signature = {
                enabled = false,
            },
        },
        routes = {
            -- save file dialogs, etc.
            {
                filter = {
                    event = "msg_show",
                    kind = "confirm",
                },
                view = "cmdline",
            },
            {
                -- written messages
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
        },
    },
    keys = {
        { "<leader>nn", "<Cmd>Noice<CR>",        desc = "Show" },
        { "<leader>na", "<Cmd>NoiceAll<CR>",     desc = "Show All" },
        { "<leader>nd", "<Cmd>NoiceDismiss<CR>", desc = "Dismiss" },
        { "<leader>nl", "<Cmd>NoiceLast<CR>",    desc = "Show Last" },
    },
}
