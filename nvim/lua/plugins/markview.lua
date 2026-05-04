-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },
    preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
    },
};
