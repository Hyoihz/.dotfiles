local g = vim.g
local o = vim.opt
local indent = 4

-- leader
g.mapleader = " "
g.maplocalleader = " "

-- use filetype.lua instead of filetype.vim
g.did_load_filetypes = 0
g.do_filetype_lua = 1

-- autocomplete
o.completeopt = { "menu", "menuone", "noselect" }
o.pumheight = 10

-- backups
o.backup = false
o.writebackup = false
o.swapfile = false

-- indentation
o.autoindent = true
o.expandtab = true
o.smartindent = true
o.shiftwidth = indent
o.softtabstop = indent
o.tabstop = indent

-- search
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- ui
o.conceallevel = 0
o.cmdheight = 1
o.cursorline = true
o.fillchars = {
	-- horiz = "━",
	-- horizup = "┻",
	-- horizdown = "┳",
	-- vert = "┃",
	-- vertleft = "┫",
	-- vertright = "┣",
	-- verthoriz = "╋",
	eob = " ",
}
o.lazyredraw = true
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.scrolloff = 8
o.showmode = false
o.showtabline = 2
o.sidescrolloff = 8
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true

-- performance
o.timeoutlen = 300
o.ttimeoutlen = 10
o.updatetime = 100

-- misc
o.autoread = true
o.clipboard = "unnamedplus"
o.fileencoding = "utf-8"
o.mouse = "a"
o.shortmess:append("csI")
o.undofile = true
o.whichwrap:append("<>[]hl")

-- disable builtin vim plugins
local default_plugins = {
	"2html_plugin",
	"bugreport",
	"compiler",
	"ftplugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"matchit",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"optwin",
	"tar",
	"tarPlugin",
	"rplugin",
	"rrhelper",
	"spellfile_plugin",
	"synmenu",
	"syntax",
	"tutor",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end

-- disable providers
local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	g["loaded_" .. provider .. "_provider"] = 0
end
