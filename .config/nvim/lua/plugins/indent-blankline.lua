return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufNewFile", "BufRead" },
	config = function()
		local status_ok, indent_blankline = pcall(require, "indent_blankline")
		if not status_ok then
			return
		end

		indent_blankline.setup({
			buftype_exclude = { "terminal", "nofile" },
			filetype_exclude = {
				"alpha",
				"dashboard",
				"help",
				"neo-tree",
				"lazy",
			},
			context_char = "¦",
			use_treesitter = true,
			show_current_context = true,
		})
	end,
}
