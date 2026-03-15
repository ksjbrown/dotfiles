return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function(_, opts)
            require("nvim-treesitter").setup()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "java",
                    "json",
                    "lua",
                    "markdown",
                    "go",
                    "python",
                    "rust",
                },
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            vim.g.no_plugin_maps = true
        end,
        keys = {
            { "am", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects") end, mode = { "x", "o" }, desc = "Around Method" },
            { "ac", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects") end, mode = { "x", "o" }, desc = "Around Class"},
            { "im", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inside Method" },
            { "ic", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inside Class"},
            { "]m", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "]M", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "[m", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "[M", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
            { "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, mode = { "n", "x", "o" }, desc = ""},
        },
        opts = {
            select = {
                lookahead = true,
            },
        }
    }
}
