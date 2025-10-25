local M = {}

function M.root()
	local path = vim.api.nvim_buf_get_name(0)
  local roots = {}
  for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
    local workspace = client.config.root_dir
    if workspace and path:find(workspace, 1, true) then
      table.insert(roots, workspace)
    end
  end
  table.sort(roots, function(a, b) return #a > #b end)
  local root = roots[1] or vim.fs.root(0, { ".git", "lua", "package.json", "pyproject.toml" })
  return root or vim.loop.cwd()
end

return M
