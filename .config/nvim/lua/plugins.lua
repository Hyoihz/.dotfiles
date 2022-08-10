local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	auto_reload_compiled = true,
	compile_on_sync = true,
	git = { clone_timeout = 6000 },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local use = function(plugin)
	return function(opts)
		opts = opts or {}
		if not opts[1] or vim.fn.isdirectory(vim.fn.expand(opts[1])) == 0 then opts[1] = plugin end
		if type(opts.config) == "string" then opts.config = "require'" .. opts.config .. "'" end
		if type(opts.setup) == "string" then opts.setup = "lazy'" .. opts.setup .. "'" end
		if opts.setup then opts.opt = true end
		packer.use(opts)
	end
end

-- core
use "nvim-lua/plenary.nvim" { module = "plenary" },
use "catppuccin/nvim" {
	as = "catppuccin",
	run = ":CatppuccinCompile",
	config = "config.colorscheme",
}
use "kyazdani42/nvim-web-devicons" { module = "nvim-web-devicons", after = "catppuccin" }
use({
	"nvim-lualine/lualine.nvim",
	after = "nvim-web-devicons",
	config = "config.lualine",
})
use({
	"akinsho/bufferline.nvim",
	after = "nvim-web-devicons",
	config = "config.bufferline",
})
use({
	"famiu/bufdelete.nvim",
	setup = "bufdelete.nvim",
})
use({
	"lukas-reineke/indent-blankline.nvim",
	opt = true,
	config = function()
		require("config.indent-blankline")
	end,
	setup = function()
		lazy("indent-blankline.nvim")
	end,
})
use({
	opt = true,
	config = function()
		require("config.colorizer")
	end,
	setup = function()
		lazy("nvim-colorizer.lua")
	end,
})
use({
	"folke/which-key.nvim",
	opt = true,
	config = function()
		require("config.whichkey")
	end,
	setup = function()
		lazy("which-key.nvim")
	end,
})

-- Git
use({
	"lewis6991/gitsigns.nvim",
	opt = true,
	config = function()
		require("config.gitsigns")
	end,
	setup = function()
		lazy("gitsigns.nvim")
	end,
})

-- Autocomplete + Snippet
use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
use({
	"hrsh7th/nvim-cmp",
	after = "friendly-snippets",
	config = function()
		require("config.cmp")
	end,
})
use({
	"L3MON4D3/LuaSnip",
	requires = "friendly-snippets",
	after = "nvim-cmp",
})
use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
use({ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" })

use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
use({ "hrsh7th/cmp-cmdline", after = "cmp-path" })
use({
	"windwp/nvim-autopairs",
	after = "nvim-cmp",
	config = function()
		require("config.autopairs")
	end,
})

-- LSP
use({
	"neovim/nvim-lspconfig",
	opt = true,
	config = function()
		require("config.lsp")
	end,
	setup = function()
		lazy("nvim-lspconfig")
	end,
})
use({ "williamboman/nvim-lsp-installer", cmd = { "LspInstall", "LspInstallInfo", "LspInstallLog" } })
use("tamago324/nlsp-settings.nvim")
use("jose-elias-alvarez/null-ls.nvim")

-- Telescope
use({
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = function()
		require("config.telescope")
	end,
})

-- Treesitter
use({
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("config.treesitter")
	end,
	run = ":TSUpdate",
})

use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter" })
use({ "p00f/nvim-ts-rainbow", requires = "nvim-treesitter" })
use({ "windwp/nvim-ts-autotag", requires = "nvim-treesitter" })

-- Terminal
use({
	"akinsho/toggleterm.nvim",
	keys = { [[<c-\>]], "<leader>g" },
	config = function()
		require("config.toggleterm")
	end,
})

-- File tree
use({
	"kyazdani42/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = function()
		require("config.nvim-tree")
	end,
})

-- Miscs
use("lewis6991/impatient.nvim")
use("nvim-lua/popup.nvim")
use "wbthomason/packer.nvim" {
	cmd = {
		"PackerSnapshot",
		"PackerSnapshotRollback",
		"PackerSnapshotDelete",
		"PackerInstall",
		"PackerUpdate",
		"PackerSync",
		"PackerClean",
		"PackerCompile",
		"PackerStatus",
		"PackerProfile",
		"PackerLoad",
	},
	config = "plugins",
}
use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
use("antoinemadec/FixCursorHold.nvim")
use({
	"ahmedkhalf/project.nvim",
	after = "telescope.nvim",
	config = function()
		require("config.project")
	end,
})
use({
	"numToStr/Comment.nvim",
	module = "Comment",
	keys = { "gc", "gb" },
	config = function()
		require("config.comment")
	end,
})
use({
	"goolord/alpha-nvim",
	requires = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("config.alpha")
	end,
})

use({
	"Pocco81/AutoSave.nvim",
	opt = true,
	config = function()
		require("config.autosave")
	end,
	setup = function()
		lazy("AutoSave.nvim")
	end,
})

