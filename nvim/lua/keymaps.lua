local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set(mode, lhs, rhs, opts)
end
local function map_n(lhs, rhs, opts) map("n", lhs, rhs, opts) end
local function map_v(lhs, rhs, opts) map("v", lhs, rhs, opts) end
local function map_nv(lhs, rhs, opts) map({ "n", "v" }, lhs, rhs, opts) end
local function map_nx(lhs, rhs, opts) map({ "n", "x" }, lhs, rhs, opts) end

map_n("<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy: Open plugin manager" })

map_n("<leader>q", "<Cmd>qa<CR>", { desc = "Quit all windows" })
map_n("<C-q>", "<Cmd>qa<CR>", { desc = "Quit all windows" })
map_n("<C-s>", "<Cmd>w<CR>", { desc = "Save current file" })

map_n("<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

map_n("<leader>bb", "<Cmd>b#<CR>", { desc = "Buffer: Switch to previous" })
map_n("<leader>bd", "<Cmd>Bdelete<CR>", { desc = "Buffer: Delete current buffer" })
map_n("<leader>bn", "<Cmd>enew<CR>", { desc = "Buffer: Create new empty buffer" })
map_n("<leader>br", "<Cmd>e!<CR>", { desc = "Buffer: Reload file from disk" })
map_n("<leader>bw", "<Cmd>wa<CR>", { desc = "Buffer: Save to file" })
map_n("<leader>!", "<Cmd>e!<CR>", { desc = "Buffer: Discard changes and reload" })

map_n("<leader>wd", "<Cmd>close<CR>", { desc = "Window: Close current" })
map_n("<leader>wv", "<Cmd>vsplit<CR>", { desc = "Window: Split vertically" })
map_n("<leader>wh", "<Cmd>split<CR>", { desc = "Window: Split horizontally" })
map_n("<leader>wt", "<C-w>T", { desc = "Window: Move to Tab" })
map_n("<leader>wH", "<C-w>H", { desc = "Window: Move Left" })
map_n("<leader>wJ", "<C-w>J", { desc = "Window: Move Down" })
map_n("<leader>wK", "<C-w>K", { desc = "Window: Move Up" })
map_n("<leader>wL", "<C-w>L", { desc = "Window: Move Right" })

map_n("<C-h>", "<C-w>h", { desc = "Window: Navigate to left pane" })
map_n("<C-j>", "<C-w>j", { desc = "Window: Navigate to lower pane" })
map_n("<C-k>", "<C-w>k", { desc = "Window: Navigate to upper pane" })
map_n("<C-l>", "<C-w>l", { desc = "Window: Navigate to right pane" })

map_n("<C-Up>", "<Cmd>resize +2<CR>", { desc = "Window: Increase height" })
map_n("<C-Down>", "<Cmd>resize -2<CR>", { desc = "Window: Decrease height" })
map_n("<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Window: Decrease width" })
map_n("<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Window: Increase width" })

map_n("<M-j>", "<Cmd>execute 'move .+' . v:count1<CR>", { desc = "Move current line(s) down" })
map_n("<M-k>", "<Cmd>execute 'move .-' . (v:count1 + 1)<CR>", { desc = "Move current line(s) up" })

map_n("<M-h>", "zH", { desc = "Horizontal scroll: View left" })
map_n("<M-l>", "zL", { desc = "Horizontal scroll: View right" })

map_v("<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down", silent = true })
map_v("<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up", silent = true })

map_v("<", "<gv", { desc = "Visual: Dedent and reselect" })
map_v(">", ">gv", { desc = "Visual: Indent and reselect" })

map_nv("j", "v:count == 0 ? 'gj' : 'j'", { desc = "Navigate screen lines (wrap-aware)", expr = true })
map_nv("k", "v:count == 0 ? 'gk' : 'k'", { desc = "Navigate screen lines (wrap-aware)", expr = true })

map_nv("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Show code actions" })
map_nv("<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostics: Show under cursor" })
map_nv("<leader>cr", vim.lsp.buf.rename, { desc = "LSP: Rename symbol under cursor" })

map_n("<leader>sf", function() vim.notify("Filetype: " .. vim.bo.filetype) end, { desc = "Show: Filetype" })
map_n("<leader>Sf", function() vim.cmd("setfiletype " .. vim.fn.input("Filetype: ")) end, { desc = "Set: Filetype" })
map_n("<leader>sc", function() vim.notify("Colorscheme: " .. vim.g.colors_name) end, { desc = "Show: Colorscheme" })

map_nx("s", "<Nop>", { desc = "Disable 's' (substitute character)" })
