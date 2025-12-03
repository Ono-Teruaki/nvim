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

-- 反映時間の短縮
opt.updatetime = 250
opt.timeoutlen = 250
