return {
	"petertriho/nvim-scrollbar",
	event = "BufReadPost", -- ファイルを開いた時に読み込む
	config = function()
		require("scrollbar").setup({
			show_symbol = false, -- バーの中に変な記号を出したくない場合はfalse
			handlers = {
				cursor = true, -- カーソル位置を表示
				diagnostic = true, -- LSPのエラー位置を表示
				gitsigns = true, -- Gitの変更箇所を表示
				search = true, -- 検索結果の位置を表示
			},
		})
	end,
}
