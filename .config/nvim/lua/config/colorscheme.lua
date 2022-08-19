local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

vim.g.catppuccin_flavour = "mocha"

local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"

catppuccin.setup({
	transparent_background = true,
	term_colors = true,
	compile = {
		enabled = true,
	},
	integrations = {
		nvimtree = {
			transparent_panel = true,
		},
		lsp_saga = true,
		dashboard = false,
		markdown = false,
		ts_rainbow = true,
		notify = false,
        telekasten = false,
		symbols_outline = false,
		vimwiki = false,
		beacon = false,
	},
	custom_highlights = {
		-- General
		Normal = { bg = colors.none },
		NormalFloat = { bg = colors.none },
		LineNr = { fg = colors.overlay1 },
		CursorLine = { bg = colors.surface1 },
		CursorLineNr = { fg = colors.lavender },
		Comment = { fg = colors.overlay1 },
		-- Bufferline
		BufferLineFill = { bg = colors.surface0 },
		BufferLineModified = { fg = colors.rosewater },
		BufferLineModifiedSelected = { fg = colors.yellow },
		-- NvinTree
		NvimTreeGitNew = { fg = colors.mauve },
		-- Telescope
		TelescopeSelection = { fg = colors.pink, bg = colors.surface1 },
		-- Completion
		PmenuSel = { fg = colors.pink },
		CmpItemAbbrMatch = { fg = colors.blue },
		CmpItemAbbrMatchFuzzy = { fg = colors.yellow },
		-- LSP diagnostics
		DiagnosticVirtualTextError = { bg = colors.none },
		DiagnosticVirtualTextWarn = { bg = colors.none },
		DiagnosticVirtualTextInfo = { bg = colors.none },
		DiagnosticVirtualTextHint = { bg = colors.none },
		--Lspsaga
		FinderParam = { fg = colors.mauve, bg = colors.none, bold = true },
		FinderVirtText = { fg = colors.blue },
		DefinitionsIcon = { fg = colors.blue },
		ImplementsIcon = { fg = colors.blue },
		TargetFileName = { fg = colors.text },
		LspSagaFinderSelection = { fg = colors.pink, bg = colors.surface1, bold = true },
	},
})

vim.api.nvim_command("colorscheme catppuccin")
