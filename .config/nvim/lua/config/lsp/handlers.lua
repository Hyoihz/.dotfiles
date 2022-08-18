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

	map("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "lsp definitions" }, opts)
	map("n", "gD", vim.lsp.buf.declaration, { desc = "lsp declaration" }, opts)
	map("n", "gI", require("telescope.builtin").lsp_implementations, { desc = "lsp implementations" }, opts)
	map("n", "gt", require("telescope.builtin").lsp_type_definitions, { desc = "lsp type definitions" }, opts)
	map("n", "<leader>lr", require("telescope.builtin").lsp_references, { desc = "lsp references" }, opts)

    -- code action
	map("n", "<leader>la", function()
		require("lspsaga.codeaction"):code_action()
	end, { desc = "lsp code action" }, opts)
	map("v", "<leader>la", function()
		require("lspsaga.codeaction"):range_code_action()
	end, { desc = "lsp code action (range)" }, opts)

    -- diagnostics
	map("n", "gj", require("lspsaga.diagnostic").goto_next, { desc = "lsp diagnostic (next)" }, opts)
	map("n", "gk", require("lspsaga.diagnostic").goto_prev, { desc = "lsp diagnostic (prev)" }, opts)
	map("n", "gJ", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "lsp diagnostic error (next)" }, opts)
	map("n", "gK", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "lsp diagnostic error (prev)" }, opts)
	map("n", "gl", require("lspsaga.diagnostic").show_line_diagnostics, { desc = "lsp diagnostic (current line)" }, opts)
	map("n", "gL", function()
		require("telescope.builtin").diagnostics({ bufnr = 0 })
	end, { desc = "lsp diagnostic (current buffer)" }, opts)
	map("n", "<leader>ll", function()
		require("telescope.builtin").diagnostics({ bufnr = nil })
	end, { desc = "lsp diagnostic (all buffers)" }, opts)

    -- finder
	map("n", "<leader>lf", function()
		require("lspsaga.finder"):lsp_finder()
	end, { desc = "lsp finder" }, opts)

    -- formatting 
    map("n", "gf", vim.lsp.buf.formatting_sync, { desc = "lsp formatting" }, opts)
	map("v", "gf", vim.lsp.buf.range_formatting, { desc = "lsp formatting (range)" }, opts)

    -- hover
	map("n", "K", require("lspsaga.hover").render_hover_doc, { desc = "lsp hover" }, opts)

    -- previewer
	map("n", "<leader>lp", function()
		require("lspsaga.definition"):preview_definition()
	end, { desc = "lsp preview definition" }, opts)

    -- rename
	map("n", "gr", function()
		require("lspsaga.rename"):lsp_rename()
	end, { desc = "lsp rename" }, opts)

    -- signature help
	map("n", "<leader>lh", require("lspsaga.signaturehelp").signature_help, { desc = "lsp signature help" }, opts)

    -- scrolling
	map("n", "<C-u>", function()
		require("lspsaga.action").smart_scroll_with_saga(-1)
	end, { desc = "lsp scroll (up)" }, opts)
	map("n", "<C-d>", function()
		require("lspsaga.action").smart_scroll_with_saga(1)
	end, { desc = "lsp scroll (down)" }, opts)

    -- symbols
	map("n", "<leader>ls", require("telescope.builtin").lsp_document_symbols, { desc = "lsp document symbols" }, opts)
	map("n", "<leader>lw", require("telescope.builtin").lsp_workspace_symbols, { desc = "lsp workspace symbols" }, opts)
	map("n", "<leader>ld", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "lsp dynamic workspace symbols" }, opts)

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	if client.resolved_capabilities.document_highlight then
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

M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

return M
