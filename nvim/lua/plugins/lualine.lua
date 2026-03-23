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
                theme = "catppuccin-nvim",
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
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
                    {
                        "diagnostics",
                        padding = {
                            left = 0,
                            right = 1,
                        },
                        symbols = {
                            error = '󰅚',
                            warn  = '󰀪',
                            info  = '󰋽',
                            hint  = '󰌶',
                        }
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        newfile_status = true,
                        path = 0,
                    },
                    {
                        "navic",
                        color_correction = "static",
                        cond = function()
                            return require("ksj").lualine.navic
                        end,
                    },
                },
                lualine_x = {
                    "%S",
                    {
                        "filetype",
                        icon_only = true,
                        padding = {
                            left = 1,
                            right = 0,
                        },
                    },
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
    },
    {
        "SmiteshP/nvim-navic",
        opts = {
            highlight = true,
            lsp = { auto_attach = true, },
        },
    },
}
