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
            { "ab", function() require "nvim-treesitter-textobjects.select".select_textobject("@block.outer", "textobjects") end, mode = { "x", "o" } },
            { "ib", function() require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects") end, mode = { "x", "o" } },
            { "]b", function() require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]B", function() require("nvim-treesitter-textobjects.move").goto_next_end("@block.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[b", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[B", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@block.outer", "textobjects") end, mode = { "n", "x", "o" } },

            { "ac", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects") end, mode = { "x", "o" } },
            { "ic", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects") end, mode = { "x", "o" } },
            { "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, mode = { "n", "x", "o" } },

            { "af", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects") end, mode = { "x", "o" } },
            { "if", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects") end, mode = { "x", "o" } },
            { "[f", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[F", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]f", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]F", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, mode = { "n", "x", "o" } },

            { "ai", function() require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects") end, mode = { "x", "o" } },
            { "ii", function() require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects") end, mode = { "x", "o" } },
            { "[i", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[I", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]i", function() require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]I", function() require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects") end, mode = { "n", "x", "o" } },

            { "al", function() require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects") end, mode = { "x", "o" } },
            { "il", function() require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects") end, mode = { "x", "o" } },
            { "[l", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[L", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]l", function() require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]L", function() require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects") end, mode = { "n", "x", "o" } },

            { "am", function() require "nvim-treesitter-textobjects.select".select_textobject("@call.outer", "textobjects") end, mode = { "x", "o" } },
            { "im", function() require "nvim-treesitter-textobjects.select".select_textobject("@call.inner", "textobjects") end, mode = { "x", "o" } },
            { "[m", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@call.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "[M", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@call.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]m", function() require("nvim-treesitter-textobjects.move").goto_next_start("@call.outer", "textobjects") end, mode = { "n", "x", "o" } },
            { "]M", function() require("nvim-treesitter-textobjects.move").goto_next_end("@call.outer", "textobjects") end, mode = { "n", "x", "o" } },
        },
        opts = {
            select = {
                lookahead = true,
            },
        }
    }
}
