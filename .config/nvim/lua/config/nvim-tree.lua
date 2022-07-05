local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	view = {
		mappings = {
			list = {
				{ key = "l", action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "<C-s>", action = "split" },
			},
		},
	},
	renderer = {
		root_folder_modifier = ":t",
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
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	diagnostics = {
		enable = true,
	},
	filters = {
		custom = { ".git" },
		exclude = { ".gitignore" },
	},
	filesystem_watchers = {
		enable = true,
		interval = 100,
		debounce_delay = 50,
	},
})
