return {
    "sindrets/diffview.nvim",
    config = function()
        -- diffview-nvim
        -- <leader>dv: ベースブランチを入力して diff（デフォルト develop、merge-base 起点）
        -- 空のまま Enter で従来どおり作業ツリー差分（DiffviewOpen）
        vim.keymap.set("n", "<leader>dv", function()
            local base = vim.fn.input("Base branch: ", "develop")
            if base == "" then
                vim.cmd("DiffviewOpen")
            else
                vim.cmd("DiffviewOpen " .. base .. "...HEAD")
            end
        end, { desc = "Diffview (base branch / working tree)" })
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", {})
    end
}
