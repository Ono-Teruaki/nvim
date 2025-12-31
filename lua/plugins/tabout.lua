return {
    'abecodes/tabout.nvim',
    config = function()
        require('tabout').setup({
            tabkey = '<Tab>',       -- ジャンプに使うキー
            backwards_tabkey = '<S-Tab>', -- 逆方向にジャンプ
            act_as_tab = true,      -- 括弧の外にいない時は通常のTabとして動作
            completion = true,      -- nvim-cmpなどの補完メニューが開いている時はTaboutを無効化
        })
    end,
    dependencies = { -- 以下のプラグインと一緒に使うのがおすすめ
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
        "hrsh7th/nvim-cmp"
    },
    event = 'InsertEnter', -- インサートモードに入った時にロード
}
