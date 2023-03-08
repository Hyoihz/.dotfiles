local autocmd = vim.api.nvim_create_autocmd

-- press "q" to close
autocmd({ "FileType" }, {
	pattern = { "qf", "help", "lspinfo", "null-ls-info" },
	callback = function()
		vim.cmd([[
            nnoremap <silent> <buffer> q :close<CR>
            set nobuflisted
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

-- wrap and check for spell in text filetypes
autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
