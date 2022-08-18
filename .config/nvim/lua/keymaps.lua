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

-- TERMINAL --
map("n", [[<C-\>]], "<cmd>ToggleTerm<cr>", { desc = "open terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { desc = "terminal normal mode" })

-- lazygit
map("n", "<leader>gg", function()
	require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
end, { desc = "open lazygit" })

-- htop 
map("n", "<leader>th", function()
	require("toggleterm.terminal").Terminal:new({ cmd = "htop", hidden = true }):toggle()
end, { desc = "open htop" })

-- ncdu
map("n", "<leader>ts", function()
	require("toggleterm.terminal").Terminal:new({ cmd = "ncdu --color dark", hidden = true }):toggle()
end, { desc = "open ncdu" })

-- node 
map("n", "<leader>tn", function()
	require("toggleterm.terminal").Terminal:new({ cmd = "node", hidden = true }):toggle()
end, { desc = "open node" })

-- python 
map("n", "<leader>tp", function()
	require("toggleterm.terminal").Terminal:new({ cmd = "python3", hidden = true }):toggle()
end, { desc = "open python" })


-- OTHERS --
-- Standard operations
map("n", "<leader>h", "<cmd>noh<cr>", { desc = "remove highlight" })
map("n", "<leader>q", "<cmd>q!<cr>", { desc = "quit" })
map("n", "<leader>s", "<cmd>split<cr>", { desc = "horizontal split" })
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "vertical split" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "save" })

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "packer compile" })
map("n", "<leader>pd", "<cmd>PackerClean<cr>", { desc = "packer clean" })
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "packer install" })
map("n", "<leader>py", "<cmd>PackerSync<cr>", { desc = "packer sync" })
map("n", "<leader>ps", "<cmd>PackerStatus<cr>", { desc = "packer status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "packer update" })

-- Bufdelete
map("n", "<leader>d", "<cmd>Bdelete!<cr>", { desc = "close buffer" })

-- Gitsigns
map("n", "<leader>gj", function() require("gitsigns").next_hunk() end, { desc = "next hunk" })
map("n", "<leader>gk", function() require("gitsigns").prev_hunk() end, { desc = "previous git hunk" })
map("n", "<leader>gl", function() require("gitsigns").blame_line() end, { desc = "view git blame" })
map("n", "<leader>gn", function() require("gitsigns").stage_hunk() end, { desc = "stage git hunk" })
map("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "preview git hunk" })
map("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, { desc = "reset git hunk" })
map("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, { desc = "reset git buffer" })
map("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "unstage git hunk" })
map("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "view git diff" })

map("v", "<leader>gn", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "stage git hunk (range)" })
map("v", "<leader>gh", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "reset git hunk (range)" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "toggle explorer" })

-- Telescope
local nvim_conf = os.getenv("HOME") .. "/.dotfiles/.config/nvim"
local dotfiles = os.getenv("HOME") .. "/.dotfiles"

map("n", "<leader>ft", function()
	require("telescope.builtin").builtin(require("telescope.themes").get_dropdown({ previewer = false }))
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

map("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "search help" })
map("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "search keymaps" })
map("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "search history" })
map("n", "<leader>fw", function() require("telescope.builtin").grep_string() end, { desc = "search word under cursor" })

map("n", "<leader>gs", function() require("telescope.builtin").git_status() end, { desc = "git status" })
map("n", "<leader>gb", function() require("telescope.builtin").git_branches() end, { desc = "git branches" })
map("n", "<leader>gc", function() require("telescope.builtin").git_commits() end, { desc = "git commits" })

map("n", "<leader>'", function() require("telescope.builtin").marks() end, { desc = "search marks" })
map("n", [[<leader>"]], function() require("telescope.builtin").registers() end, { desc = "search registers" })

-- Misc
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "lsp info" })
map("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "mason package manager" })
map("n", "<leader>ln", "<cmd>NullLsInfo<cr>", { desc = "null-ls info" })
