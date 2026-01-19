local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ターミナルモードからの脱出
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-[>", "<C-\\><C-n>", opts)

-- ウィンドウ移動
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- 検索ハイライトの削除
keymap("n", "<Esc><Esc>", ":nohlsearch<CR>", opts)

-- インデント操作の改善
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- <C-n> でファイラを左側に開閉する (Explore)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", { silent = true })

-- diffview-nvim
keymap("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", opts)
keymap("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", opts)
