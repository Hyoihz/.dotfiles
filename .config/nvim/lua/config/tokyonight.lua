vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. "tokyonight")
if not status_ok then
	return
end

vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#c0caf5" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#c0caf5" })

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#3d59a1" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#db4b4b" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTexWarn", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#0db9d7" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#1abc9c" })
