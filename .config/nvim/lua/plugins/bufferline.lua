return {
	"akinsho/bufferline.nvim",
	event = { "BufNewFile", "BufRead", "TabEnter" },
	config = function()
		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end

		bufferline.setup({
			options = {
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
				modified_icon = "",
				tab_size = 20,
				show_close_icon = false,
				offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
			},
		})
	end,
}
