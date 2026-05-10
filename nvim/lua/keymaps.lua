local keymaps = {
    {
        modes = { "n" },
        mappings = {
            {
                "<leader>L",
                "<Cmd>Lazy<CR>",
                desc = "Lazy: Open plugin manager",
            },

            {
                "<leader>q",
                "<Cmd>qa<CR>",
                desc = "Quit all windows",
            },
            {
                "<C-q>",
                "<Cmd>qa<CR>",
                desc = "Quit all windows",
            },
            {
                "<C-s>",
                "<Cmd>w<CR>",
                desc = "Save current file",
            },

            {
                "<Esc>",
                "<Cmd>nohlsearch<CR>",
                desc = "Clear search highlights",
            },

            {
                "<leader>bb",
                "<Cmd>b#<CR>",
                desc = "Buffer: Switch to previous",
            },
            {
                "<leader>bd",
                "<Cmd>Bdelete<CR>",
                desc = "Buffer: Delete current buffer",
            },
            {
                "<leader>bn",
                "<Cmd>enew<CR>",
                desc = "Buffer: Create new empty buffer",
            },
            {
                "<leader>br",
                "<Cmd>e!<CR>",
                desc = "Buffer: Reload file from disk",
            },
            {
                "<leader>bw",
                "<Cmd>wa<CR>",
                desc = "Buffer: Save to file",
            },
            {
                "<leader>!",
                "<Cmd>e!<CR>",
                desc = "Buffer: Discard changes and reload",
            },

            {
                "<leader>wd",
                "<Cmd>close<CR>",
                desc = "Window: Close current",
            },
            {
                "<leader>wv",
                "<Cmd>vsplit<CR>",
                desc = "Window: Split vertically",
            },
            {
                "<leader>wh",
                "<Cmd>split<CR>",
                desc = "Window: Split horizontally",
            },
            {
                "<leader>wH",
                "<C-w>H",
                desc = "Window: Move Left",
            },
            {
                "<leader>wJ",
                "<C-w>J",
                desc = "Window: Move Down",
            },
            {
                "<leader>wK",
                "<C-w>K",
                desc = "Window: Move Up",
            },
            {
                "<leader>wL",
                "<C-w>L",
                desc = "Window: Move Right",
            },

            {
                "<C-h>",
                "<C-w>h",
                desc = "Window: Navigate to left pane",
            },
            {
                "<C-j>",
                "<C-w>j",
                desc = "Window: Navigate to lower pane",
            },
            {
                "<C-k>",
                "<C-w>k",
                desc = "Window: Navigate to upper pane",
            },
            {
                "<C-l>",
                "<C-w>l",
                desc = "Window: Navigate to right pane",
            },

            {
                "<C-Up>",
                "<Cmd>resize +2<CR>",
                desc = "Window: Increase height",
            },
            {
                "<C-Down>",
                "<Cmd>resize -2<CR>",
                desc = "Window: Decrease height",
            },
            {
                "<C-Left>",
                "<Cmd>vertical resize -2<CR>",
                desc = "Window: Decrease width",
            },
            {
                "<C-Right>",
                "<Cmd>vertical resize +2<CR>",
                desc = "Window: Increase width",
            },

            {
                "<M-j>",
                "<Cmd>execute 'move .+' . v:count1<CR>",
                desc = "Move current line(s) down",
            },
            {
                "<M-k>",
                "<Cmd>execute 'move .-' . (v:count1 + 1)<CR>",
                desc = "Move current line(s) up",
            },

            {
                "<M-h>",
                "8zh",
                desc = "Horizontal scroll: View left (10 cols)",
            },
            {
                "<M-l>",
                "8zl",
                desc = "Horizontal scroll: View right (10 cols)",
            },
            {
                "<M-H>",
                "zH",
                desc = "Horizontal scroll: View left (half screen)",
            },
            {
                "<M-L>",
                "zL",
                desc = "Horizontal scroll: View right (half screen)",
            },
        },
    },
    {
        modes = { "v" },
        mappings = {
            {
                "<M-j>",
                ":m '>+1<CR>gv=gv",
                desc = "Move selected line(s) down",
                silent = true,
            },
            {
                "<M-k>",
                ":m '<-2<CR>gv=gv",
                desc = "Move selected line(s) up",
                silent = true,
            },

            {
                "<",
                "<gv",
                desc = "Visual: Dedent and reselect",
            },
            {
                ">",
                ">gv",
                desc = "Visual: Indent and reselect",
            },
        },
    },
    {
        modes = { "n", "v" },
        mappings = {
            {
                "j",
                "v:count == 0 ? 'gj' : 'j'",
                desc = "Navigate screen lines (wrap-aware)",
                expr = true,
            },
            {
                "k",
                "v:count == 0 ? 'gk' : 'k'",
                desc = "Navigate screen lines (wrap-aware)",
                expr = true,
            },

            {
                "<F2>",
                vim.lsp.buf.rename,
                desc = "LSP: Rename symbol under cursor",
            },
            {
                "<leader>.",
                vim.lsp.buf.code_action,
                desc = "LSP: Show code actions",
            },
            {
                "<leader>ca",
                vim.lsp.buf.code_action,
                desc = "LSP: Show code actions",
            },
            {
                "<leader>cd",
                vim.diagnostic.open_float,
                desc = "Diagnostics: Show under cursor",
            },
            {
                "<leader>cr",
                vim.lsp.buf.rename,
                desc = "LSP: Rename symbol under cursor",
            },
        },
    },
    {
        modes = { "n", "x" },
        mappings = {
            {
                "s",
                "<Nop>",
                desc = "Disable 's' (substitute character)",
            },
        },
    },
}

for _, group in ipairs(keymaps) do
    for _, mapping in ipairs(group.mappings) do
        local opts = { desc = mapping.desc }
        if mapping.expr then opts.expr = true end
        if mapping.silent then opts.silent = true end
        vim.keymap.set(group.modes, mapping[1], mapping[2], opts)
    end
end
