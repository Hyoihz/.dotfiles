local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"cssls",
	"eslint",
	"emmet_ls",
	"html",
	"jsonls",
	"pyright",
	"sumneko_lua",
	"tsserver",
}

lsp_installer.setup({
	ensure_installed = servers,
	ui = { border = "rounded" },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}

	local has_opts, custom_opts = pcall(require, string.format("config.lsp.settings." .. server))
	if has_opts then
		opts = vim.tbl_deep_extend("force", custom_opts, opts)
	end

	lspconfig[server].setup(opts)
end