local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

_G.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			require("packer").loader(plugin)
		end, timer)
	end
end

return packer.startup(function(use)
	use({
		"lewis6991/impatient.nvim",
		"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
	})

	use({
		"folke/tokyonight.nvim",
		config = function()
			require("config.tokyonight")
		end,
	})
	use({ "kyazdani42/nvim-web-devicons", after = "tokyonight.nvim" })
	use({
		"nvim-lualine/lualine.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("config.lualine")
		end,
	})
	use({
		"famiu/bufdelete.nvim",
		opt = true,
		setup = function()
			lazy("bufdelete.nvim")
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("config.bufferline")
		end,
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
		"norcalli/nvim-colorizer.lua",
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
			vim.defer_fn(function()
				vim.cmd("silent! e %")
			end, 0)
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

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
