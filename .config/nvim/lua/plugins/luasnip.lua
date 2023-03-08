return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	config = function()
		local snip_status_ok, luasnip = pcall(require, "luasnip")
		if not snip_status_ok then
			return
		end

		luasnip.setup({
			history = true,
			delete_check_events = "TextChanged",
		})
	end,
}
