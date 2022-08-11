local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl = "Function"
	b.opts.hl_shortcut = "Constant"
	return b
end

dashboard.section.header.val = {
	"                                                              ",
	"    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ",
	" ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ",
	" ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ",
	"   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ",
	"      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ",
	"        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ",
	"             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ",
	"             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ",
	"             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ",
	"                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ",
	"                            ⠘⣷⠁                               ",
	"                             ⠙⣤                               ",
	"                              ⠛⠂                              ",
	"                                                              ",
}

dashboard.section.buttons.val = {
	button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	button("F", "  Find text", ":Telescope live_grep <CR>"),
	button("f", "  Find file", ":Telescope find_files theme=dropdown previewer=false<CR>"),
	button("p", "  Find project", ":Telescope projects <CR>"),
	button("r", "  Recent files", ":Telescope oldfiles <CR>"),
	button("c", "  Configuration", ":NvimTreeToggle ~/.config/nvim/lua<CR>"),
	button("u", "  Update plugins", ":PackerUpdate <CR>"),
	button("q", "  Quit neovim", ":qa<CR>"),
}

local num_plugins_start = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1)
local num_plugins_opt = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/opt", "*", 0, 1)

dashboard.section.footer.val = { "~ " .. num_plugins_start + num_plugins_opt .. " total plugins ﮣ installed ~" }

dashboard.section.header.opts.hl = "Identifier"
dashboard.section.footer.opts.hl = "Comment"

dashboard.opts.opts.noautocmd = true

dashboard.config.layout = {
	{ type = "padding", val = 2 },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 2 },
	dashboard.section.footer,
}

alpha.setup(dashboard.opts)
