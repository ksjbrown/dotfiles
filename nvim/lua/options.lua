vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu" }
vim.opt.confirm = true
vim.opt.cursorline = true -- highlight current line
vim.opt.cursorlineopt = "number,line"
vim.opt.expandtab = true
vim.opt.hidden = true -- allow buffer switching without saving
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.list = false
vim.opt.listchars = { tab = "→ ", space = "·", extends = ">", precedes = "<", eol = "↴" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2        -- line number column width
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.smartcase = true
vim.opt.shiftwidth = 4   -- number of spaces per indentation
vim.opt.showcmd = true   -- we use noice instead
vim.opt.showmode = false -- we use lualine instead
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.softtabstop = 4 -- number of spaces per tab
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4          -- number of spaces per tab
vim.opt.termguicolors = true -- 24-bit colors
vim.opt.timeout = false
vim.opt.timeoutlen = 500     -- time to wait for a mapped sequence
vim.opt.undofile = true      -- persistent undo
vim.opt.updatetime = 200     -- faster completion and CursorHold
vim.opt.writebackup = false
vim.opt.winborder = "rounded"
vim.opt.wrap = false -- don't wrap lines

-- IDE
vim.opt.completeopt = { "menu", "menuone", "noinsert" }

-- Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text after yanking",
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- only show cursorline in active window
local cursorline_group = vim.api.nvim_create_augroup("ActiveCursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter" }, {
    group = cursorline_group,
    callback = function() vim.wo.cursorline = true end,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
    group = cursorline_group,
    callback = function() vim.wo.cursorline = false end,
})

-- Key options
vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = "\\"

-- Android (Termux) specific options
local is_termux = (vim.env.TERMUX_VERSION ~= nil)
if is_termux then
    require("ksj").lualine.progress = false
    vim.opt.number = false
end
