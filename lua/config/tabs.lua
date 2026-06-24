-- タブ体験の改善: 切替キー / 自作タブライン / リネーム
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- タブ切替 (Shift+H = 前 / Shift+L = 次)
-- 注: diffview のファイル一覧パネル内では大文字 L が buffer-local の
--     commit-log 表示に割当てられているため、そのパネル内だけ L は次タブにならない。
--     H はどこでも前タブ、コードの diff 窓では L も次タブとして効く。
keymap("n", "<S-h>", "<cmd>tabprevious<CR>", opts)
keymap("n", "<S-l>", "<cmd>tabnext<CR>", opts)

-- タブの表示名を決定する。
-- 優先順: vim.t(tabname) のカスタム名 > diffview 判定 > バッファのファイル名
local function tab_label(tabid)
    local ok, custom = pcall(vim.api.nvim_tabpage_get_var, tabid, "tabname")
    if ok and custom ~= nil and custom ~= "" then
        return custom
    end

    local win = vim.api.nvim_tabpage_get_win(tabid)
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })

    if name:match("^diffview://") or ft == "DiffviewFiles" or ft == "DiffviewFileHistory" then
        return "Diffview"
    end
    if name == "" then
        return "[No Name]"
    end
    return vim.fn.fnamemodify(name, ":t")
end

-- 自作タブライン（パスを潰した既定表示を、ファイル名 / カスタム名に置換）
function _G.my_tabline()
    local parts = {}
    local cur = vim.api.nvim_get_current_tabpage()
    for idx, tabid in ipairs(vim.api.nvim_list_tabpages()) do
        local hl = (tabid == cur) and "%#TabLineSel#" or "%#TabLine#"
        -- "%<idx>T" でクリック時に該当タブへ移動できるようにする
        parts[#parts + 1] = hl .. "%" .. idx .. "T " .. idx .. ":" .. tab_label(tabid) .. " "
    end
    parts[#parts + 1] = "%#TabLineFill#%T"
    return table.concat(parts)
end

vim.o.tabline = "%!v:lua.my_tabline()"
-- 既定(showtabline=1)はタブが2つ以上で表示。常時表示したいなら下行を有効化
-- vim.o.showtabline = 2

-- リネーム: :TabRename <name>（空で解除）/ <leader>tr（tmux の Cmd+Shift+i 相当）
vim.api.nvim_create_user_command("TabRename", function(o)
    vim.api.nvim_tabpage_set_var(0, "tabname", o.args)
    vim.cmd("redrawtabline")
end, { nargs = "?", desc = "現在のタブに表示名を付ける（空で解除）" })

keymap("n", "<leader>tr", function()
    local cur = ""
    local ok, c = pcall(vim.api.nvim_tabpage_get_var, 0, "tabname")
    if ok and c then cur = c end
    local name = vim.fn.input("Tab name: ", cur)
    vim.api.nvim_tabpage_set_var(0, "tabname", name)
    vim.cmd("redrawtabline")
end, { desc = "Rename current tab" })
