return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- 入力モードに入った時に読み込む
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSPソース
      "hrsh7th/cmp-buffer",   -- バッファ内文字ソース
      "hrsh7th/cmp-path",     -- パスソース
      "L3MON4D3/LuaSnip",     -- スニペットエンジン
      "saadparwaiz1/cmp_luasnip", -- スニペットソース
      "rafamadriz/friendly-snippets", -- 有用なスニペット集 (VSCodeライク)
      "onsails/lspkind.nvim", -- 補完メニューにアイコンを表示
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- VSCodeライクなスニペットを読み込む
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        -- スニペットエンジンの設定（必須）
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        -- 見た目の設定 (アイコンを表示)
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol", 
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },

        -- キーマッピング
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- 前の候補へ
          ["<C-j>"] = cmp.mapping.select_next_item(), -- 次の候補へ
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- ドキュメントスクロール(上)
          ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- ドキュメントスクロール(下)
          ["<C-Space>"] = cmp.mapping.complete(),     -- 手動で補完を出す
          ["<C-e>"] = cmp.mapping.abort(),            -- 補完をキャンセル
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enterで確定
        }),

        -- 補完ソースの優先順位
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP (最優先)
          { name = "luasnip" },  -- スニペット
          { name = "buffer" },   -- バッファ内の単語
          { name = "path" },     -- ファイルパス
        }),
      })
    end,
  },
}
