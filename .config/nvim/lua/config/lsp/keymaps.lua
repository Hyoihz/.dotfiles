local M = {}

-- Mappings.
function M.init(bufnr)
    local map = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	map("n", "gd", function() return require("telescope.builtin").lsp_definitions() end, bufopts )
	map("n", "gD", function() return vim.lsp.buf.declaration() end, bufopts)
	map("n", "gi", function() return require("telescope.builtin").lsp_implementations() end, bufopts)
	map("n", "gt", function() return require("telescope.builtin").lsp_type_definitions() end, bufopts )
    map("n", "gr", function() return require("telescope.builtin").lsp_references() end , bufopts)

	-- diagnostics
	map("n", "gl", function() return vim.diagnostic.open_float({ border = "rounded" }) end, bufopts)
	map("n", "gL", function() return require("telescope.builtin").diagnostics({ bufnr = 0 })  end, bufopts)

	-- hover
	map("n", "K", function() return vim.lsp.buf.hover() end, bufopts)
end

return M
