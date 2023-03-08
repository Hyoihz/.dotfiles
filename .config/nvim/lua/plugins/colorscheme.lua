return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local status_ok, catppuccin = pcall(require, "catppuccin")
		if not status_ok then
			return
		end

		local mocha = require("catppuccin.palettes").get_palette("mocha")
		mocha.none = "NONE"

		catppuccin.setup({
			flavour = "mocha",
			transparent_background = true,
			term_colors = true,
			integrations = {
				aerial = false,
				barbar = false,
				barbecue = false,
				beacon = false,
				coc_nvim = false,
				cmp = true,
				dap = false,
				dashboard = false,
				fern = false,
				fidget = false,
				gitgutter = false,
				gitsigns = true,
				harpoon = false,
				hop = false,
				illuminate = false,
				leap = false,
				lightspeed = false,
				lsp_trouble = false,
				lsp_saga = true,
				markdown = true,
				mason = true,
				mini = false,
				neogit = false,
				neotest = false,
				neotree = true,
				noice = false,
				notify = false,
				nvimtree = false,
				overseer = false,
				pounce = false,
				sandwich = false,
				semantic_tokens = false,
				symbols_outline = false,
				telekasten = false,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				ts_rainbow = false,
				ts_rainbow2 = true,
				vim_sneak = false,
				vimwiki = false,
				which_key = false,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				navic = {
					enabled = false,
					custom_bg = "NONE",
				},
			},
			custom_highlights = {
				-- General
				Normal = { bg = mocha.none },
				NormalFloat = { bg = mocha.none },
				LineNr = { fg = mocha.overlay1 },
				CursorLine = { bg = mocha.surface1 },
				CursorLineNr = { fg = mocha.lavender },
				Comment = { fg = mocha.overlay1 },
				-- Bufferline
				BufferLineFill = { bg = mocha.surface0 },
				BufferLineModified = { fg = mocha.rosewater },
				BufferLineModifiedSelected = { fg = mocha.yellow },
				-- Telescope
				TelescopeSelection = { fg = mocha.pink, bg = mocha.surface1 },
				-- Completion
				PmenuSel = { fg = mocha.pink },
				CmpItemAbbrMatch = { fg = mocha.blue },
				CmpItemAbbrMatchFuzzy = { fg = mocha.yellow },

				-- LSP diagnostics
				--[[ DiagnosticVirtualTextError = { bg = mocha.none }, ]]
				--[[ DiagnosticVirtualTextWarn = { bg = mocha.none }, ]]
				--[[ DiagnosticVirtualTextInfo = { bg = mocha.none }, ]]
				--[[ DiagnosticVirtualTextHint = { bg = mocha.none }, ]]
				-- Lspsaga
				-- FinderParam = { fg = mocha.mauve, bg = mocha.none, bold = true },
				-- FinderVirtText = { fg = mocha.blue },
				-- DefinitionsIcon = { fg = mocha.blue },
				-- ImplementsIcon = { fg = mocha.blue },
				-- TargetFileName = { fg = mocha.text },
				-- LspSagaFinderSelection = { fg = mocha.pink, bg = mocha.surface1, bold = true },
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
