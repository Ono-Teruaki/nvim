return {
    {
        "cocopon/iceberg.vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme iceberg]])
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    }
}
