local M = {
	lualine = {
		progress = true,
		filetype = true,
		path = 3,
		lsp = true,
	},
	options = {
	},
}
local is_termux = (vim.env.TERMUX_VERSION ~= nil)
if is_termux then
	M.lualine.progress = false
	M.lualine.filetype = false
	M.lualine.path = 0
	M.lualine.lsp = false
end

return M
