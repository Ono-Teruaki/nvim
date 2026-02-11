return {
    "carlos-algms/agentic.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim", -- コンテキスト選択（@）に必要
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- プロバイダーを Gemini に設定
        provider = "gemini-acp",
        -- ウィンドウのレイアウト設定
        layout = {
            width = 0.4,
            position = "right",
        },
    },
    keys = {
        -- Space + a + a でチャットをトグル (Agentic Ask)
        { "<leader>aa", function() require("agentic").toggle() end,      desc = "Agentic Toggle",      mode = { "n", "v" } },
        -- Space + a + c で現在のバッファをコンテキストに追加 (Add Context)
        { "<leader>ac", function() require("agentic").add_context() end, desc = "Agentic Add Context", mode = { "n", "v" } },
        -- インサートモード中でもサッと呼び出したい場合（例: Ctrl + g）
        { "<C-g>",      function() require("agentic").toggle() end,      desc = "Agentic Toggle",      mode = { "i" } },
    },
}
