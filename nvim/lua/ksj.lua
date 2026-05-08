local M = {
	lualine = {
		progress = true,
		path = 3,
		lsp = true,
	},
	options = {
		line_numbers = true,
	},
}
local is_termux = (vim.env.TERMUX_VERSION ~= nil)
if is_termux then
	M.lualine.progress = false
	M.lualine.path = 0
	M.lualine.lsp = false
	M.options.line_numbers = false
end

return M
