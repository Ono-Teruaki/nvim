return {
    "sindrets/diffview.nvim",
    config = function()
        -- diffview-nvim
        -- diffview-nvim
        vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", {})
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", {})
        -- <leader>db: rev 範囲を入力して diff（デフォルト develop... = merge-base 起点 / PR 相当）
        --   例: develop...origin/rearch/stock_taking-be → PR と同じ差分
        --   develop... のまま Enter → develop...HEAD（現在ブランチ）
        vim.keymap.set("n", "<leader>db", function()
            local rev = vim.fn.input("Diff range: ", "develop...")
            if rev ~= "" then
                vim.cmd("DiffviewOpen " .. rev)
            end
        end, { desc = "Diffview vs base branch" })
    end
}
