local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.init_lsp_saga({
	border_style = "rounded",
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	diagnostic_header = { "  ", "  ", "  ", "  " },
	code_action_icon = " ",
	code_action_lightbulb = {
		virtual_text = false,
	},
	finder_action_keys = {
		open = "l",
		vsplit = "<C-v>",
		split = "<C-s>",
		scroll_up = "<C-u>",
		scroll_down = "<C-d>",
		quit = { "q", "<C-c>" },
	},
	rename_in_select = false,
})
