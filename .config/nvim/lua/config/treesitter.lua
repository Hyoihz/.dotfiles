local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = "all",
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "yaml", "python" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = { "#E5C07B", "#C678DD", "#E06C75", "#61AFEF", "#98C379", "#56B6C2", "#ABB2BF" },
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})
