local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = true,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		cmp = true,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		bufferline = true,
		ts_rainbow = true,
	},
})

vim.api.nvim_command("colorscheme catppuccin")

--vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#c0caf5" })
--vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#c0caf5" })
--
--vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3d59a1" })
--vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#3d59a1" })
--
--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#db4b4b" })
--vim.api.nvim_set_hl(0, "DiagnosticVirtualTexWarn", { fg = "#e0af68" })
--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#0db9d7" })
--vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#1abc9c" })
