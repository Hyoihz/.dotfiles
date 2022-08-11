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
		if not opts[1] or vim.fn.isdirectory(vim.fn.expand(opts[1])) == 0 then
			opts[1] = plugin
		end
		if type(opts.config) == "string" then
			opts.config = "require'" .. opts.config .. "'"
		end
		if type(opts.setup) == "string" then
			opts.setup = "lazy'" .. opts.setup .. "'"
		end
		if opts.setup then
			opts.opt = true
		end
		packer.use(opts)
	end
end

-- core
use "nvim-lua/plenary.nvim" { module = "plenary" }
use "catppuccin/nvim" {
	as = "catppuccin",
	run = ":CatppuccinCompile",
	config = "config.colorscheme",
}
use "kyazdani42/nvim-web-devicons" {
    module = "nvim-web-devicons",
    after = "catppuccin",
}
use "nvim-lualine/lualine.nvim" {
	after = "nvim-web-devicons",
	config = "config.lualine",
}
use "akinsho/bufferline.nvim" {
	after = "nvim-web-devicons",
	config = "config.bufferline",
}
use "famiu/bufdelete.nvim" {
	setup = "bufdelete.nvim",
}
use "lukas-reineke/indent-blankline.nvim" {
	config = "config.indent-blankline",
	setup = "indent-blankline.nvim",
}
use "norcalli/nvim-colorizer.lua" {
	config = function()
		require("config.colorizer")
		vim.api.nvim_command("ColorizerAttachToBuffer")
	end,
	setup = "nvim-colorizer.lua",
}
use "folke/which-key.nvim" {
	config = "config.whichkey",
	setup = "which-key.nvim",
}

-- Git
use "lewis6991/gitsigns.nvim" {
	config = "config.gitsigns",
	setup = "gitsigns.nvim",
}

-- Autocomplete + Snippet
use "rafamadriz/friendly-snippets" { event = "InsertEnter" }
use "hrsh7th/nvim-cmp" {
	after = "friendly-snippets",
	config = "config.cmp",
}
use "L3MON4D3/LuaSnip" {
	requires = "friendly-snippets",
	after = "nvim-cmp",
}
use "saadparwaiz1/cmp_luasnip" { after = "LuaSnip" }
use "hrsh7th/cmp-nvim-lsp" { after = "cmp_luasnip" }

use "hrsh7th/cmp-buffer" { after = "cmp-nvim-lsp" }
use "hrsh7th/cmp-path" { after = "cmp-buffer" }
use "hrsh7th/cmp-cmdline" { after = "cmp-path" }
use "windwp/nvim-autopairs" {
	after = "nvim-cmp",
	config = "config.autopairs",
}

-- LSP
use "neovim/nvim-lspconfig" {
	config = "config.lsp.lspconfig",
	setup = "nvim-lspconfig",
}

use "williamboman/mason.nvim" {
    module = "mason",
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonInstallAll",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
    },
}

use "williamboman/mason-lspconfig.nvim" {
    module = "mason-lspconfig",
    cmd = { "LspInstall", "LspUninstall" },
}

use "jose-elias-alvarez/null-ls.nvim" {
	after = "nvim-lspconfig",
	config = "config.lsp.null-ls",
}

-- Telescope
use "nvim-telescope/telescope.nvim" {
	module = "telescope",
	cmd = "Telescope",
	config = "config.telescope",
}

-- Treesitter
use "nvim-treesitter/nvim-treesitter" {
	run = ":TSUpdate",
	config = "config.treesitter",
	setup = "nvim-treesitter",
}

use "JoosepAlviste/nvim-ts-context-commentstring" { after = "nvim-treesitter", requires = "nvim-treesitter" }
use "p00f/nvim-ts-rainbow" { after = "nvim-treesitter", requires = "nvim-treesitter" }
use "windwp/nvim-ts-autotag" { after = "nvim-treesitter", requires = "nvim-treesitter" }

-- Terminal
use "akinsho/toggleterm.nvim" {
	keys = { [[<c-\>]], "<leader>g" },
	cmd = { "ToggleTerm", "TermExec" },
	config = "config.toggleterm",
}

-- File tree
use "kyazdani42/nvim-tree.lua" {
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = "config.nvim-tree",
}

-- Miscs
use "lewis6991/impatient.nvim" { module = "impatient" }
use "nvim-lua/popup.nvim" { module = "popup" }
use "antoinemadec/FixCursorHold.nvim" { module = "FixCursorHold" }

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
use "dstein64/vim-startuptime" { cmd = "StartupTime" }
use "ahmedkhalf/project.nvim" {
	after = "telescope.nvim",
	config = "config.project",
}
use "numToStr/Comment.nvim" {
	module = "Comment",
	keys = { "gc", "gb" },
	config = "config.comment",
}
use "goolord/alpha-nvim" {
	requires = { "kyazdani42/nvim-web-devicons" },
	config = "config.alpha",
}
use "Pocco81/auto-save.nvim" {
	config = "config.auto-save",
	setup = "auto-save.nvim",
}
