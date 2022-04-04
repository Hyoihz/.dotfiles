local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = null_ls.builtins.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({
		-- 	extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--tab-width 4" },
		-- }),
		formatting.prettier.with({
			extra_args = function(params)
				return params.options
					and params.options.tabSize
					and {
						"--tab-width",
						params.options.tabSize,
                        "--no-semi"
					}
			end,
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
        -- diagnostics.eslint,
        -- code_actions.eslint
		-- completion.spell,
	},
})
