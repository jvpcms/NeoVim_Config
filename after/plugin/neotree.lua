local neotree = require("neo-tree")

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle float<CR>")

neotree.setup({
    filesystem = {

        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
        },

        follow_current_file = {
            enabled = true,
        },

        use_libuv_file_watcher = true,

        renderers = {
            file = {
                { "icon" },
                { "name",       use_git_status_colors = true },
                { "diagnostics" },
                { "git_status", highlight = "NeoTreeDimText" },
            },
        },
    },
    window = {
        mappings = {
            ["l"] = "open",
            ["<CR>"] = "open",
        },
    },
    event_handlers = {
        {
            event = "file_open_requested",
            handler = function()
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
})
