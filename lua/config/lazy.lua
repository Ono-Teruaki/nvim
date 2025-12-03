local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新の安定版を使用
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ここが重要: "plugins" フォルダの中身を自動で全部読み込む設定
require("lazy").setup({
  spec = {
    { import = "plugins" }, 
  },
  checker = { enabled = true }, -- プラグインの更新を自動チェック
})
