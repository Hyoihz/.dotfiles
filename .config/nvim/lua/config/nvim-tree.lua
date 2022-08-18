local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	view = {
		width = 32,
		mappings = {
			list = {
				{ key = "l", action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "<C-s>", action = "split" },
				{ key = "<esc>", action = "clear_live_filter" },
			},
		},
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":p:~",
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "S",
					untracked = "U",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			warning = "",
		},
	},
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore" },
	},
})
