return {
	{
		"famiu/bufdelete.nvim",
		cmd = "Bdelete",
	},
	{
		"kylechui/nvim-surround",
		keys = { "ys", "yS", "cs", "ds", "gS", "<C-g>", "S" },
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"gbprod/stay-in-place.nvim",
		keys = { "<", ">", "=", "v", "V" },
		config = function()
			require("stay-in-place").setup()
		end,
	},
}
