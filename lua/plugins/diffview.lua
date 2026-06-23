return {
    "sindrets/diffview.nvim",
    config = function()
        -- diffview-nvim
        -- <leader>dv: 入力して diff（デフォルト develop、merge-base 起点）
        --   空 Enter        -> 作業ツリー差分（DiffviewOpen）
        --   単一ブランチ名  -> base...HEAD（例: develop -> develop...HEAD）
        --   範囲指定(.. 含む) -> そのまま渡す（例: develop..SB-2651）
        vim.keymap.set("n", "<leader>dv", function()
            local arg = vim.fn.input("Base branch / range: ", "develop")
            if arg == "" then
                vim.cmd("DiffviewOpen")
            elseif arg:find("%.%.") then
                vim.cmd("DiffviewOpen " .. arg)
            else
                vim.cmd("DiffviewOpen " .. arg .. "...HEAD")
            end
        end, { desc = "Diffview (base branch / range / working tree)" })
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", {})
    end
}
