local M = {}

function M.init(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp_document_highlight",
			pattern = "<buffer>",
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			pattern = "<buffer>",
			callback = vim.lsp.buf.clear_references,
		})
	end
end

return M
