return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				-- ターミナルのサイズ
				size = 20,

				open_mapping = [[<C-t>]],

				hide_numbers = true, -- 行番号を消す
				shade_filetypes = {},
				shade_terminals = true, -- 背景を少し暗くする
				start_in_insert = true, -- 開いた時にインサートモードにする
				insert_mappings = true, -- ターミナルモードでもキーマップを有効にする
				persist_size = true, -- サイズを記憶する

				direction = "float",

				close_on_exit = true, -- exitしたら閉じる
				shell = vim.o.shell, -- デフォルトシェルを使う

				-- フローティングウィンドウのデザイン
				float_opts = {
					border = "curved", -- 角丸の枠線
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
		end,
	},
}
