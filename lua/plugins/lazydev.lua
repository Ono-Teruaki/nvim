return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- Luaファイルを開いたときだけ読み込む
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
}
