local M = {
	lualine = {
		progress = true,
		filetype = true,
		lsp = true,
	},
	options = {
        go_test_args = { "-v", "-race", "-count=1" },
	},
}
local is_termux = (vim.env.TERMUX_VERSION ~= nil)
if is_termux then
	M.lualine.progress = false
	M.lualine.filetype = false
	M.lualine.lsp = false
    M.options.go_test_args = { "-v", "-count=1" }
end

return M
