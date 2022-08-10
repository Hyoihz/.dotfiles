local autocmd = vim.api.nvim_create_autocmd

-- PackerCompile on save if in plugins.lua or colorscheme.lua
autocmd("BufWritePost", {
	pattern = { "plugins.lua", "colorscheme.lua" },
	callback = function()
		vim.cmd "PackerCompile"
	end
})

-- update catppuccin every time packer is compiled
autocmd("User", {
	pattern = "PackerCompileDone",
	callback = function()
		vim.cmd "CatppuccinCompile"
		vim.defer_fn(function()
			vim.cmd "colorscheme catppuccin"
		end, 0) -- Defered for live reloading
	end
})

-- disable statusline if in alpha greeter, and re-enable before unloading a buffer
autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
            set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2
        ]])
	end,
})

-- press "q" to close
autocmd({ "FileType" }, {
	pattern = { "qf", "help", "startuptime", "lspinfo", "null-ls-info" },
	callback = function()
		vim.cmd([[
            nnoremap <silent> <buffer> q :close<CR>
            set nobuflisted
        ]])
	end,
})

-- quit if nvim-tree is the only window open
autocmd({ "BufEnter" }, {
	nested = true,
	callback = function()
		vim.cmd([[
            if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
        ]])
	end,
})

-- prevent auto-commenting
autocmd({ "Filetype" }, {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua" },
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- highlight on yank
autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- goto last position when entering file
autocmd({ "BufReadPost" }, {
	callback = function()
		vim.cmd([[
            if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
        ]])
	end,
})
