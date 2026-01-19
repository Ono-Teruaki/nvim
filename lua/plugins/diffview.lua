return {
    "sindrets/diffview.nvim",
    config = function()
        -- diffview-nvim
        vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", {})
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", {})
    end
}
