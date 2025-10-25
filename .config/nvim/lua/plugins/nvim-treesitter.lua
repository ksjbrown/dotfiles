return {
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
            ignore_install = {},
            modules = {},
            sync_install = false,
            highlight = {
                enable = true,
            },
        })
    end,
}
