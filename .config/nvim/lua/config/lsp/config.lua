local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local mason_lspc_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspc_status_ok then
	return
end

mason.setup({
	ui = { border = "rounded" },
})

mason_lspconfig.setup({
	ensure_installed = {
		"cssls",
		"eslint",
		"emmet_ls",
		"html",
		"jsonls",
		"pyright",
		"sumneko_lua",
		"tsserver",
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local win = require("lspconfig.ui.windows")
local _default_opts = win.default_opts

win.default_opts = function(options)
	local opts = _default_opts(options)
	opts.border = "single"
	return opts
end

mason_lspconfig.setup_handlers({
	function(server)
		local opts = {
			on_attach = require("config.lsp.handlers").on_attach,
			capabilities = require("config.lsp.handlers").capabilities,
		}
		local has_opts, custom_opts = pcall(require, "config.lsp.settings." .. server)
		if has_opts then
			opts = vim.tbl_deep_extend("force", custom_opts, opts)
		end
		lspconfig[server].setup(opts)
	end,
})
