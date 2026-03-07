-- https://github.com/nvim-lualine/lualine.nvim
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "folke/noice.nvim",
            "nvim-tree/nvim-web-devicons",
            "SmiteshP/nvim-navic",
        },
        lazy = false,
        init = function()
            vim.opt.laststatus = 3
            vim.opt.showcmd = true
            vim.opt.showcmdloc = "statusline"
        end,
        opts = {
            options = {
                theme = "catppuccin",
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' }
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(res) return res:sub(1, 1) end,
                    },
                },
                lualine_b = {
                    "branch",
                    "diff",
                    "diagnostics",
                },
                lualine_c = {
                    {
                        "filetype",
                        separator = "",
                        icon_only = true,
                        padding = {
                            left = 1,
                            right = 0,
                        },
                    },
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                        separator = ":",
                    },
                    {
                        "navic",
                        color_correction = "static",
                    },
                },
                lualine_x = {
                    { "%S" },
                },
                lualine_y = {},
                lualine_z = {},
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
    },
    {
        "SmiteshP/nvim-navic",
        opts = {
            highlight = true,
            lsp = { auto_attach = true, },
        },
    },
}
