local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
        modified_icon = '',
		tab_size = 20,
		show_close_icon = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
})
