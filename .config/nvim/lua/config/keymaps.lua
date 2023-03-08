local map = vim.keymap.set

map({ "n", "v" }, "<Space>", "<Nop>")

-- NORMAL --
-- Buffer navigation
map("n", "<S-h>", "<cmd>bp<cr>", { desc = "previous buffer" })
map("n", "<S-l>", "<cmd>bn<cr>", { desc = "next buffer" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "move to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "move to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "move to right split" })

-- Resize with arrows
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "resize split left" })
map("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "resize split down" })
map("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "resize split up" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "resize split right" })

-- INSERT --
-- Insert mode navigation
map("i", "<C-h>", "<Left>", { desc = "move to left char" })
map("i", "<C-j>", "<Down>", { desc = "move to right char" })
map("i", "<C-k>", "<Up>", { desc = "move to above char" })
map("i", "<C-l>", "<Right>", { desc = "move to below char" })

-- VISUAL --
-- Avoid yanking when pasting over selected text
map("v", "p", '"_dP', { desc = "paste below" })

-- Stay in visual mode when indenting
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Move selected line / block of text in visual mode
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "move highlighted line below" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "move highlighted line above" })

-- OTHERS --
-- Standard operations
map("n", "<leader>h", "<cmd>noh<cr>", { desc = "remove highlight" })
map("n", "<leader>q", "<cmd>q!<cr>", { desc = "quit" })
map("n", "<leader>s", "<cmd>split<cr>", { desc = "horizontal split" })
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "vertical split" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "save" })

-- Bufdelete
map("n", "<leader>d", "<cmd>Bdelete!<cr>", { desc = "close buffer" })
map("n", "<leader>D", '<cmd>%bdelete|edit #|normal `"<cr>', { desc = "close all buffers except current" })

-- Gitsigns
map("n", "[g", function()
	require("gitsigns").prev_hunk()
end, { desc = "previous git hunk" })
map("n", "]g", function()
	require("gitsigns").next_hunk()
end, { desc = "next hunk" })
map("n", "<leader>gl", function()
	require("gitsigns").blame_line()
end, { desc = "view git blame" })
map({ "n", "v" }, "<leader>gh", function()
	require("gitsigns").stage_hunk()
end, { desc = "stage git hunk" })
map({ "n", "v" }, "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, { desc = "reset git hunk" })
map("n", "<leader>gR", function()
	require("gitsigns").reset_buffer()
end, { desc = "reset git buffer" })
map("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "preview git hunk" })
map("n", "<leader>gu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "unstage git hunk" })
map("n", "<leader>gd", function()
	require("gitsigns").diffthis()
end, { desc = "view git diff" })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "toggle explorer" })

-- Telescope
local nvim_conf = os.getenv("HOME") .. "/.config/nvim"
local dotfiles = os.getenv("HOME") .. "/.dotfiles"

map("n", "<leader>ft", function()
	require("telescope.builtin").builtin(require("telescope.themes").get_dropdown({ previewer = true }))
end, { desc = "search telescope builtins" })

map("n", "<leader>fb", function()
	require("telescope.builtin").buffers(
		require("telescope.themes").get_dropdown({ previewer = false, ignore_current_buffer = true })
	)
end, { desc = "search buffers" })

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files(
		require("telescope.themes").get_dropdown({ previewer = false, hidden = true })
	)
end, { desc = "search files" })
map("n", "<leader>fF", function()
	require("telescope.builtin").find_files(
		require("telescope.themes").get_dropdown({ previewer = false, hidden = true, no_ignore = true })
	)
end, { desc = "search all files" })

map("n", "<leader>fc", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		prompt_title = "Neovim config",
		previewer = false,
		hidden = true,
		search_dirs = { nvim_conf },
	}))
end, { desc = "search files in nvim config" })
map("n", "<leader>fC", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		prompt_title = "Neovim config",
		previewer = false,
		hidden = true,
		no_ignore = true,
		search_dirs = { nvim_conf },
	}))
end, { desc = "search all files in nvim config" })

map("n", "<leader>fd", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		prompt_title = "Dotfiles",
		previewer = false,
		hidden = true,
		search_dirs = { dotfiles },
	}))
end, { desc = "search files in dotfiles" })
map("n", "<leader>fD", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		prompt_title = "Dotfiles",
		previewer = false,
		hidden = true,
		no_ignore = true,
		search_dirs = { dotfiles },
	}))
end, { desc = "search all files in dotfiles" })

map("n", "<leader>fs", function()
	require("telescope.builtin").live_grep({ hidden = true })
end, { desc = "search words" })
map("n", "<leader>fS", function()
	require("telescope.builtin").live_grep({ hidden = true, no_ignore = true })
end, { desc = "search words in all files" })

map("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "search help" })
map("n", "<leader>fk", function()
	require("telescope.builtin").keymaps()
end, { desc = "search keymaps" })
map("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, { desc = "search history" })
map("n", "<leader>fw", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "fuzzy search current buffer" })
map("n", "<leader>fW", function()
	require("telescope.builtin").grep_string()
end, { desc = "search word under cursor" })

map("n", "<leader>gf", function()
	require("telescope.builtin").git_files()
end, { desc = "git files" })
map("n", "<leader>gs", function()
	require("telescope.builtin").git_status()
end, { desc = "git status" })
map("n", "<leader>gb", function()
	require("telescope.builtin").git_branches()
end, { desc = "git branches" })
map("n", "<leader>gc", function()
	require("telescope.builtin").git_commits()
end, { desc = "git commits" })

map("n", "<leader>'", function()
	require("telescope.builtin").marks()
end, { desc = "search marks" })
map("n", [[<leader>"]], function()
	require("telescope.builtin").registers()
end, { desc = "search registers" })

-- Misc
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "lsp info" })
map("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "mason package manager" })
map("n", "<leader>ln", "<cmd>NullLsInfo<cr>", { desc = "null-ls info" })
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "lazy" })
