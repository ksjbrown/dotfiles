vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu" }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,line"
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.list = false
vim.opt.listchars = { tab = "→ ", space = "·", extends = ">", precedes = "<", eol = "↴" }
vim.opt.mouse = "a"
vim.opt.number = require("ksj").options.line_numbers
vim.opt.numberwidth = 2
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 200
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
	callback = function()
		vim.wo.cursorline = true
	end,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	group = cursorline_group,
	callback = function()
		vim.wo.cursorline = false
	end,
})

-- Key options
vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = " "
