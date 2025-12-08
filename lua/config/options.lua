local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.clipboard = "unnamedplus"
opt.smartindent = true
opt.splitright = true
opt.splitbelow = true
opt.undofile = true

-- 検索設定
opt.ignorecase = true
opt.smartcase = true

opt.wrap = true

-- ビジュアル設定
opt.showmode = false
opt.showcmd = true
opt.termguicolors = true

-- 反映時間の短縮
opt.updatetime = 250
opt.timeoutlen = 400

-- Netrwの設定 (標準ファイラ)
vim.g.netrw_banner = 0 -- 上部のバナー(使い方の説明)を消す
vim.g.netrw_liststyle = 3 -- ツリー形式で表示する (デフォルトはただのリスト)
vim.g.netrw_winsize = 18 -- :Vexplore で開くときの幅を18%にする
vim.g.netrw_keepdir = 1
