local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
-- local action_state = require('telescope.actions.state')
-- local telescope_custom_actions = {}
--
-- function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
-- 	local picker = action_state.get_current_picker(prompt_bufnr)
-- 	local selected_entry = action_state.get_selected_entry()
-- 	local num_selections = #picker:get_multi_selection()
-- 	if not num_selections or num_selections <= 1 then
-- 		actions.add_selection(prompt_bufnr)
-- 	end
-- 	actions.send_selected_to_qflist(prompt_bufnr)
-- 	vim.cmd("cfdo " .. open_cmd)
-- end
-- function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
-- 	telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
-- end
-- function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
-- 	telescope_custom_actions._multiopen(prompt_bufnr, "split")
-- end
-- function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
-- 	telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
-- end
-- function telescope_custom_actions.multi_selection_open(prompt_bufnr)
-- 	telescope_custom_actions._multiopen(prompt_bufnr, "edit")
-- end
--
telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { "node_modules" },
        winblend = 3,

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>

				-- ["<CR>"] = telescope_custom_actions.multi_selection_open,
				-- ["<C-V>"] = telescope_custom_actions.multi_selection_open_vsplit,
				-- ["<C-S>"] = telescope_custom_actions.multi_selection_open_split,
				-- ["<C-T>"] = telescope_custom_actions.multi_selection_open_tab,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				-- ["<CR>"] = telescope_custom_actions.multi_selection_open,
				-- ["<C-V>"] = telescope_custom_actions.multi_selection_open_vsplit,
				-- ["<C-S>"] = telescope_custom_actions.multi_selection_open_split,
				-- ["<C-T>"] = telescope_custom_actions.multi_selection_open_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		-- find_files = {
		-- 	theme = "dropdown",
		--           previewer = false,
		-- },
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})
