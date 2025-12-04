return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- 1. Mason本体のセットアップ
      require("mason").setup()

      -- 2. lspconfigの読み込み
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- 3. Mason-LSPConfigの設定 (ここを修正)
      require("mason-lspconfig").setup({
        -- 自動インストールリスト
        ensure_installed = { 
          "lua_ls",
          "pyright",
          "ts_ls", 
          "html", 
          "cssls"
        },

        handlers = {
          -- (1) デフォルトハンドラ: すべてのサーバーをデフォルト設定で起動
          function(server_name)
            lspconfig[server_name].setup({})
          end,

          -- (2) Lua専用設定 (個別設定)
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                },
              },
            })
          end,
        },
      })

      -- 4. キーマッピング (LSP起動時に有効化)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })
    end,
  }
}
