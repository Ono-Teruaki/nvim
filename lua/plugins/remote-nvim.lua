return {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("remote-nvim").setup({
            devpod = {
                binary = "devpod",
                docker_binary = "docker",
                ssh_config = {
                    ssh_binary = "ssh",
                    scp_binary = "scp",
                },
                ssh_config_path = "~/.ssh/config",
                search_style = "current_dir_only",
                gpg_agent_forwarding = false,
                container_list = "running_only",
            },
            ssh_config = {
                ssh_binary = "ssh",
                scp_binary = "scp",
                copy_method = "rsync",
                ssh_config_file_paths = { os.getenv("HOME") .. "/.ssh/config" },
                ssh_prompts = {
                    {
                        match = "password:",
                        type = "secret",
                        value_type = "dynamic",
                        value = ""
                    },
                    {
                        match = "passphrase:",
                        type = "secret",
                        value_type = "dynamic",
                        value = ""
                    },
                    {
                        match = "Are you sure you want to continue",
                        type = "plain",
                        value_type = "dynamic",
                        value = ""
                    },
                },
            },
            remote = {
                app_name = "nvim",
                copy_dirs = {
                    config = {
                        base = vim.fn.stdpath("config"),
                        -- ここを「必要なものだけ」に絞る
                        dirs = { "init.lua", "lua" },
                    },
                    data = {
                        base = vim.fn.stdpath("data"),
                        dirs = {}, -- プラグイン実体は送らず、リモートで入れ直す
                    },
                    state = {
                        base = vim.fn.stdpath("state"),
                        dirs = {},
                    },
                    cache = {
                        base = vim.fn.stdpath("cache"),
                        dirs = {},
                    },
                },
            },
            ---@diagnostic disable-next-line: assign-type-mismatch
            neovim_install_script_path = nil,
            client_callback = nil,
            progress_view = { type = "popup" },
            offline_mode = {
                enabled = false,
                no_pre_install = false,
                no_github = false,
                cache_dir = vim.fn.stdpath("cache") .. "/remote-nvim/offline",
            },
            log = {
                level = "info",
                max_size = 1024 * 1024 * 2,
                filepath = vim.fn.stdpath("state") .. "/remote-nvim.log",
            },
        })
    end,
}
