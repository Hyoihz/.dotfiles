local M = {}

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

M.on_attach = function(client, bufnr)
	local map = vim.keymap.set
	local opts = { buffer = bufnr }

	map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "lsp definitions" }, opts)
	map("n", "gD", vim.lsp.buf.declaration, { desc = "lsp declaration" }, opts)
	map("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "lsp implementations" }, opts)
	map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "lsp type definitions" }, opts)
	map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "lsp references" }, opts)

	-- code action
	map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<cr>", { desc = "lsp code action" }, opts)

	-- diagnostics
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "lsp diagnostic (prev)" }, opts)
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "lsp diagnostic (next)" }, opts)
	map("n", "[e", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "lsp diagnostic error (prev)" }, opts)
	map("n", "]e", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "lsp diagnostic error (next)" }, opts)
	map("n", "[w", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })
	end, { desc = "lsp diagnostic warning (prev)" }, opts)
	map("n", "]w", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN })
	end, { desc = "lsp diagnostic warning (next)" }, opts)
	map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "lsp diagnostic (current line)" }, opts)
	map("n", "gL", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "lsp diagnostic (current buffer)" }, opts)
	map("n", "<leader>ll", "<cmd>Telescope diagnostics bufnr=nil<cr>", { desc = "lsp diagnostic (all buffers)" }, opts)

	-- finder
	map("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", { desc = "lsp finder" }, opts)

	-- rename
	map("n", "gr", "<cmd>Lspsaga rename<cr>", { desc = "lsp rename" }, opts)

	-- formatting
	map({ "n", "v" }, "gf", function()
		local ft = vim.bo[bufnr].filetype
		local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(c)
				if have_nls then
					return c.name == "null-ls"
				end
				return c.name ~= "null-ls"
			end,
		})
	end, { desc = "lsp formatting" }, opts)

	-- hover
	map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "lsp hover" }, opts)

	-- symbols
	map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "lsp document symbols" }, opts)
	map("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "lsp workspace symbols" }, opts)
	map(
		"n",
		"<leader>ld",
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		{ desc = "lsp dynamic workspace symbols" },
		opts
	)

	if client.supports_method("textDocument/hover") then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp_document_highlight",
			pattern = "*",
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			pattern = "*",
			callback = vim.lsp.buf.clear_references,
		})
	end
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

return M
