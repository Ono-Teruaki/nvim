return {
    "sindrets/diffview.nvim",
    config = function()
        -- diffview-nvim
        vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", {})
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", {})
        -- ベースブランチを入力して diff（デフォルト develop、merge-base 起点）
        vim.keymap.set("n", "<leader>db", function()
            local base = vim.fn.input("Base branch: ", "develop")
            if base ~= "" then
                vim.cmd("DiffviewOpen " .. base .. "...HEAD")
            end
        end, { desc = "Diffview vs base branch" })
    end
}
