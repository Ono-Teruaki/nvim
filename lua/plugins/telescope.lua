return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }, -- 必須ライブラリ
        config = function()
            local builtin = require("telescope.builtin")
            -- キーマッピング
            -- <Space>ff : ファイル名で検索 (Find Files) - 隠しファイルも対象
            vim.keymap.set("n", "<Leader>ff", function()
                builtin.find_files({ hidden = true })
            end, {})
            -- <Space>fg : 文字列で検索 (Live Grep) - ripgrepが必要、隠しファイルも対象
            vim.keymap.set("n", "<Leader>fg", function()
                builtin.live_grep({ additional_args = function() return { "--hidden" } end })
            end, {})
            -- <Space>fb : 開いているバッファを検索 (Find Buffers)
            vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
            -- <Space>fh : ヘルプを検索 (Find Help)
            vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})

            -- 見た目などの設定
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", "%.git/" }, -- 検索から除外するフォルダ
                },
            })
        end,
    }
}
