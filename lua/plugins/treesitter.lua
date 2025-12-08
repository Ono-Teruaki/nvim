return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				modules = {},
				ignore_install = {},
				auto_install = true,
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query", -- Neovim動作に必須・推奨
					"markdown",
					"markdown_inline", -- ドキュメント系
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"yaml",
					"toml",
					"bash",
				},

				-- 同期インストール（false推奨: フリーズ防止）
				sync_install = false,

				-- ハイライトを有効化
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = { enable = true },

				-- インクリメンタル選択機能
				-- コードの構造単位で選択範囲を広げたり狭めたりできる
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>", -- Ctrl + Space で選択開始
						node_incremental = "<C-space>", -- もう一度押すと親要素へ拡大（ifブロック全体など）
						scope_incremental = false,
						node_decremental = "<bs>", -- Backspace で選択範囲を縮小
					},
				},
			})
		end,
	},
}
