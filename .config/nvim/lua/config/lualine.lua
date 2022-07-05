local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local mode = {
	"mode",
	padding = {
		left = 4,
		right = 3,
	},
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
	padding = {
		left = 2,
		right = 2,
	},
}

local filename = {
	"filename",
	padding = {
		left = 2,
	},
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
	padding = {
		left = 1,
		right = 2,
	},
}

local location = {
	"location",
	padding = {
		left = 1,
		right = 1,
	},
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},

	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { filename },
		lualine_x = { filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
	tabline = {},
	extensions = {},
})
