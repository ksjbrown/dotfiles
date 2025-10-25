-- https://github.com/folke/noice.nvim
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        commands = {
            all = {
                view = "popup",
                filter_opts = { reverse = true },
            },
            history = {
                view = "popup",
                opts = {
                    format = { "{date}", "{level}", "{message}", },
                },
                filter_opts = { reverse = true },
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            lsp_doc_border = true,
        },
        lsp = {
            signature = {
                enabled = false,
            },
        },
        messages = {
            opts = { format = "notify", }
        },
        views = {
            mini = { timeout = 5000, },
            popup = { scrollbar = false, },
        },
        routes = {
            filter = { event = "msg_ruler", },
            opts = { skip = true, },
        },
    },
    keys = {
        { "<leader>nn", "<Cmd>Noice<CR>",        desc = "Show" },
        { "<leader>na", "<Cmd>NoiceAll<CR>",     desc = "Show All" },
        { "<leader>nd", "<Cmd>NoiceDismiss<CR>", desc = "Dismiss" },
        { "<leader>nl", "<Cmd>NoiceLast<CR>",    desc = "Show Last" },
    },
}
