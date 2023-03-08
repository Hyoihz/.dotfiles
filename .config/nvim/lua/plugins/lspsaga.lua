return {
	"glepnir/lspsaga.nvim",
	cmd = "Lspsaga",
	config = function()
		local status_ok, lspsaga = pcall(require, "lspsaga")
		if not status_ok then
			return
		end

		lspsaga.setup({
			ui = {
				code_action = "",
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
			scroll_preview = {
				scroll_down = "<C-u>",
				scroll_up = "<C-d>",
			},
			finder = {
				keys = {
					edit = { "o", "<CR>", "l" },
					vsplit = "<C-v>",
					split = "<C-s>",
					quit = { "q", "<C-c>", "<ESC>" },
				},
			},
			lightbulb = {
				virtual_text = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
		})
	end,
}
