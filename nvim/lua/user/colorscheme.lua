vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold = true


vim.cmd([[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
colorscheme default
set background=dark
endtry
]])
