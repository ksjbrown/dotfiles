-- https://github.com/nvim-lualine/lualine.nvim
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "folke/noice.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    init = function()
        vim.opt.laststatus = 3
        vim.opt.showcmd = true
        vim.opt.showcmdloc = "statusline"
    end,
    opts = {
        options = {
            theme = "catppuccin-nvim",
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    fmt = function(res) return res:sub(1, 1) end,
                },
            },
            lualine_x = {
                { "%S", separator = "",},
                { "filetype", icon_only = true },
            },
            lualine_y = {
                {
                    "progress",
                    cond = function()
                        return require("ksj").lualine.progress
                    end,
                },
            },
            lualine_z = {
                {
                    "location",
                    cond = function()
                        return require("ksj").lualine.progress
                    end,
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
    },
}
