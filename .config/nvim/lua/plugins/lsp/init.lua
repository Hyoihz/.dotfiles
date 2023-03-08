return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_status_ok then
				return
			end

			local mason_lspc_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
			if not mason_lspc_status_ok then
				return
			end

			mason_lspconfig.setup({
				ensure_installed = {
					"cssls",
					"eslint",
					"emmet_ls",
					"html",
					"jsonls",
					"pyright",
					"tsserver",
				},
			})

			mason_lspconfig.setup_handlers({
				function(server)
					local opts = {
						on_attach = require("plugins.lsp.lsp-utils").on_attach,
						capabilities = require("plugins.lsp.lsp-utils").capabilities,
					}
					local has_opts, custom_opts = pcall(require, "plugins.lsp.providers." .. server)

					if has_opts then
						opts = vim.tbl_deep_extend("force", custom_opts, opts)
					end

					lspconfig[server].setup(opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			local mason_status_ok, mason = pcall(require, "mason")
			if not mason_status_ok then
				return
			end

			mason.setup({
				ui = { border = "rounded" },
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local status_ok, null_ls = pcall(require, "null-ls")
			if not status_ok then
				return
			end

			local formatting = null_ls.builtins.formatting
			-- local diagnostics = null_ls.builtins.diagnostics
			-- local completion = null_ls.builtins.completion
			-- local code_actions = null_ls.builtins.code_actions

			null_ls.setup({
				debug = false,
				sources = {
					formatting.prettier.with({
						extra_args = function(params)
							return params.options
								and params.options.tabSize
								and {
									"--tab-width",
									params.options.tabSize,
									"--no-semi",
								}
						end,
					}),
					formatting.black.with({ extra_args = { "--fast" } }),
					formatting.stylua,
				},
			})
		end,
	},
}
