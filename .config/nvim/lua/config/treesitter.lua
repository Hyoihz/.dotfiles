local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = "all",
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "yaml", "python" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				["ia"] = "@attribute.inner",
				["ib"] = "@block.inner",
				["id"] = "@call.inner",
				["ic"] = "@class.inner",
				["ig"] = "@comment.inner",
				["it"] = "@condition.inner",
				["il"] = "@loop.inner",
				["if"] = "@function.inner",
				["iv"] = "@parameter.inner",

				["aa"] = "@attribute.outer",
				["ab"] = "@block.outer",
				["ad"] = "@call.outer",
				["ac"] = "@class.outer",
				["ag"] = "@comment.outer",
				["at"] = "@condition.outer",
				["al"] = "@loop.outer",
				["af"] = "@function.outer",
				["as"] = "@state.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,

			goto_next_start = {
				["]a"] = "@attribute.outer",
				["]b"] = "@block.outer",
				["]d"] = "@call.outer",
				["]c"] = "@class.outer",
				["]g"] = "@comment.outer",
				["]t"] = "@condition.outer",
				["]l"] = "@loop.outer",
				["]f"] = "@function.outer",
				["]v"] = "@parameter.inner",
				["]s"] = "@state.outer",
			},
			goto_previous_start = {
				["[a"] = "@attribute.outer",
				["[b"] = "@block.outer",
				["[d"] = "@call.outer",
				["[c"] = "@class.outer",
				["[g"] = "@comment.outer",
				["[t"] = "@condition.outer",
				["[l"] = "@loop.outer",
				["[f"] = "@function.outer",
				["[v"] = "@parameter.inner",
				["[s"] = "@state.outer",
			},
			goto_next_end = {
				["]A"] = "@attribute.outer",
				["]B"] = "@block.outer",
				["]D"] = "@call.outer",
				["]C"] = "@class.outer",
				["]G"] = "@comment.outer",
				["]T"] = "@condition.outer",
				["]L"] = "@loop.outer",
				["]F"] = "@function.outer",
				["]V"] = "@parameter.inner",
				["]S"] = "@state.outer",
			},
			goto_previous_end = {
				["[A"] = "@attribute.outer",
				["[B"] = "@block.outer",
				["[D"] = "@call.outer",
				["[C"] = "@class.outer",
				["[G"] = "@comment.outer",
				["[T"] = "@condition.outer",
				["[L"] = "@loop.outer",
				["[F"] = "@function.outer",
				["[V"] = "@parameter.inner",
				["[S"] = "@state.outer",
			},
		},
	},
})
