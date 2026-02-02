local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ターミナルモードからの脱出
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-[>", "<C-\\><C-n>", opts)

-- ウィンドウ移動
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- 検索ハイライトの削除
keymap("n", "<Esc><Esc>", ":nohlsearch<CR>", opts)

-- インデント操作の改善
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- <C-n> でファイラを左側に開閉する (Explore)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", { silent = true })

-- サブモード用汎用関数
local function submode(modes, trigger, keys)
    local setup_exit_condition
    local function cleanup()
        for _, k in ipairs(keys) do
            -- 指定されたすべてのモードからマッピングを削除
            pcall(vim.keymap.del, modes, k[1], { buffer = true })
        end
        pcall(vim.keymap.del, modes, '<Esc>', { buffer = true })
    end

    for _, k in ipairs(keys) do
        -- 1. 初回のトリガー設定 (モードを動的に指定)
        vim.keymap.set(modes, trigger .. k[1], function()
            -- 初回のコマンド実行
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes(k[2], true, true, true), 'n')

            -- 2. サブモード用マッピングの設定
            local function setup_sub_keys()
                for _, sub_k in ipairs(keys) do
                    vim.keymap.set(modes, sub_k[1], function()
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(sub_k[2], true, true, true), 'n')
                        vim.schedule(setup_exit_condition)
                    end, { buffer = true, nowait = true })
                end

                -- Escで手動終了
                vim.keymap.set(modes, '<Esc>', function()
                    cleanup()
                    -- Visual modeの場合はEsc本来の「選択解除」も実行させるためfeedkeys
                    return '<Esc>'
                end, { buffer = true, expr = true })
            end

            -- 3. 終了条件の設定
            setup_exit_condition = function()
                vim.api.nvim_create_autocmd({ 'BufLeave', 'InsertEnter' }, {
                    buffer = 0,
                    once = true,
                    callback = cleanup,
                })
            end

            setup_sub_keys()
            vim.schedule(setup_exit_condition)
        end)
    end
end

-- 表示行移動
submode({ 'n', 'v' }, 'g', {
    { 'j', 'gj' },
    { 'k', 'gk' },
})

-- ウィンドウリサイズ
submode('n', '<C-w>', {
    { 'h', '<C-w><' },
    { 'j', '<C-w>+' },
    { 'k', '<C-w>-' },
    { 'l', '<C-w>>' },
})
