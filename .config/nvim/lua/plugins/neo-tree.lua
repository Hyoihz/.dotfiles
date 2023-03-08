return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "MunifTanjim/nui.nvim" },
	},
	config = function()
		local status_ok, neo_tree = pcall(require, "neo-tree")
		if not status_ok then
			return
		end

		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		neo_tree.setup({
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			default_component_configs = {
				indent = {
					indent_size = 4,
				},
				icon = {
					folder_empty = "",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						modified = "",
						-- Status type
						untracked = "?",
						ignored = "",
						unstaged = "!",
						staged = "+",
						conflict = "~",
					},
				},
			},
			window = {
				position = "left",
				width = 30,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["s"] = "open_split",
					["v"] = "open_vsplit",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
			},
			follow_current_file = true,
			use_libuv_file_watcher = true,
			git_status = {
				window = {
					mappings = {
						["gA"] = "git_add_all",
						["gcp"] = "git_commit_and_push",
					},
				},
			},
		})
	end,
}
