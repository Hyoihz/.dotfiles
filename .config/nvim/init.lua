require("options")

vim.schedule(function()
	require("keymaps")
	require("autocommands")
end)

_G.lazy = function(plugin, timer)
	vim.defer_fn(function()
		pcall(require, "impatient")
		require("packer").loader(plugin)
		if plugin == "nvim-lspconfig" then
			vim.cmd("silent! do FileType")
		end
	end, timer or 0)
end

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.api.nvim_command("packadd packer.nvim")
	require("plugins")
	require("packer").sync()
end
