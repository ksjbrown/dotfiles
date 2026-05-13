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
        vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
            callback = function()
                    require('lualine').refresh()
                -- vim.defer_fn(function()
                --     require('lualine').refresh()
                -- end, 50)
            end,
        })
        require("lualine").setup(opts)
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
                        if reg == "" then return "" end
                        return "@" .. reg
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
                {
                    function()
                        return require("dap").status()
                    end,
                    -- color = function ()
                    --     local cp = require("catppuccin.palettes").get_palette()
                    --     return { fg = cp.sapphire }
                    -- end,
                    icon = { "" },
                    cond = function()
                        return package.loaded.dap and require("dap").session() ~= nil
                    end,
                },
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
