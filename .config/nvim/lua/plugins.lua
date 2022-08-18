local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	auto_reload_compiled = true,
	git = { clone_timeout = 6000 },
	display = {
        working_sym = '',
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

-- Plugin manager
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

-- Lua development
use "nvim-lua/plenary.nvim" { module = "plenary" }

-- LSP
use "neovim/nvim-lspconfig" {
	setup = "nvim-lspconfig",
	config = "config.lsp.config",
}
use "williamboman/mason.nvim" {
    setup = "mason.nvim",
}
use "williamboman/mason-lspconfig.nvim" {
    setup = "mason-lspconfig.nvim",
}
use "jose-elias-alvarez/null-ls.nvim" {
    setup = "null-ls.nvim",
	config = "config.lsp.null-ls",
}
use "glepnir/lspsaga.nvim" {
    setup = "lspsaga.nvim",
    config = "config.lsp.lspsaga",
}

-- Completion & Snippet
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

-- Treesitter
use "nvim-treesitter/nvim-treesitter" {
    event = { "BufNewFile", "BufRead" },
	run = ":TSUpdate",
	config = "config.treesitter",
}
use "windwp/nvim-ts-autotag" { after = "nvim-treesitter" }
use "JoosepAlviste/nvim-ts-context-commentstring" { after = "nvim-treesitter" }
use "p00f/nvim-ts-rainbow" { after = "nvim-treesitter" }
use "nvim-treesitter/nvim-treesitter-textobjects" { after = "nvim-treesitter" }

-- Telescope
use "nvim-telescope/telescope.nvim" {
	module = "telescope",
	config = "config.telescope",
}
use "nvim-telescope/telescope-fzf-native.nvim" {
	run = "make",
	after = "telescope.nvim",
}

-- Git
use "lewis6991/gitsigns.nvim" {
	setup = "gitsigns.nvim",
	config = "config.gitsigns",
}

-- Terminal
use "akinsho/toggleterm.nvim" {
    module = "toggleterm",
	keys = [[<c-\>]],
	config = "config.toggleterm",
}

-- Colorscheme
use "catppuccin/nvim" {
	as = "catppuccin",
	run = ":CatppuccinCompile",
	config = "config.colorscheme",
}

-- Icon
use "kyazdani42/nvim-web-devicons" { module = "nvim-web-devicons" }

-- Tabline
use "akinsho/bufferline.nvim" {
	event = { "BufNewFile", "BufRead", "TabEnter" },
	config = "config.bufferline",
}

-- File explorer
use "kyazdani42/nvim-tree.lua" {
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = "config.nvim-tree",
}

-- Statusline 
use "nvim-lualine/lualine.nvim" {
	event = { "BufNewFile", "BufRead", "TabEnter" },
	config = "config.lualine",
}

-- Indent
use "lukas-reineke/indent-blankline.nvim" {
    event = { "BufNewFile", "BufRead" },
	config = "config.indent-blankline",
}

-- Comment
use "numToStr/Comment.nvim" {
	module = "Comment",
	keys = { "gc", "gb" },
	config = "config.comment",
}

-- Color
use "NvChad/nvim-colorizer.lua" {
    event = { "BufRead", "BufNewFile" },
	config = "config.colorizer",
}

-- Utility
use "famiu/bufdelete.nvim" { cmd = "Bdelete" }
use "lewis6991/impatient.nvim" { module = "impatient" }
use "dstein64/vim-startuptime" { cmd = "StartupTime" }
use "kylechui/nvim-surround" {
    keys = { "ys", "yS", "cs", "ds", "gS","<C-g>", "S" },
	config = function()
		require("nvim-surround").setup()
	end,
}
use "gbprod/stay-in-place.nvim" {
    keys = { "<", ">", "=", "v", "V" },
    config = function()
        require("stay-in-place").setup()
    end,
}
