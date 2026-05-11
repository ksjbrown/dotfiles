-- https://github.com/nvim-lualine/lualine.nvim
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim",
    },
    lazy = false,
    config = function (_, opts)
        vim.opt.laststatus = 3
        vim.opt.showcmd = true
        vim.opt.showcmdloc = "statusline"
        require("lualine").setup(opts)
        vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
            callback = function()
                vim.defer_fn(function()
                    require('lualine').refresh()
                end, 50)
            end,
        })
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
                {
                    -- macro recording
                    function ()
                        local reg = vim.fn.reg_recording()
                        if reg == "" then return "" end -- not recording
                        return "@" .. reg
                    end,
                    color = function()
                        local cp = require("catppuccin.palettes").get_palette()
                        return { fg = cp.yellow, gui = "bold" }
                    end,

                },
            },
            lualine_c = {
                {
                    "filename",
                    path = 1
                },
            },
            lualine_x = {
                { "%S" },
            },
            lualine_y = {
                { "filetype", icon_only = true, cond = function ()
                    return require("ksj").lualine.filetype
                end },
                { "lsp_status", icon = "󱓞", cond = function ()
                    return require("ksj").lualine.lsp
                end },
            },
            lualine_z = {
                {
                    "progress",
                    cond = function()
                        return require("ksj").lualine.progress
                    end,
                },
                {
                    "location",
                    cond = function()
                        return require("ksj").lualine.progress
                    end,
                },
            },
        },
    },
}
