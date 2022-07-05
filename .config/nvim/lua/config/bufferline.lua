local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		tab_size = 20,
		show_close_icon = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
	highlights = {

		modified_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
		},
		separator = {
			guifg = { attribute = "fg", highlight = "TabLine" },
		},
	},
})
