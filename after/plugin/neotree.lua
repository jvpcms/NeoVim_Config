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

        -- Indicate files marked by Harpoon

        components = {
            harpoon_index = function(config, node, _)
                local harpoon_list = require("harpoon"):list()
                local path = node:get_id()
                local harpoon_key = vim.uv.cwd()

                for i, item in ipairs(harpoon_list.items) do
                    local value = item.value
                    if string.sub(item.value, 1, 1) ~= "/" then
                        value = harpoon_key .. "/" .. item.value
                    end

                    if value == path then
                        vim.print(path)
                        return {
                            text = string.format(" → %d", i), -- <-- Add your favorite harpoon like arrow here
                            highlight = config.highlight or "NeoTreeDirectoryIcon",
                        }
                    end
                end
                return {}
            end,
        },
        renderers = {
            file = {
                { "icon" },
                { "name", use_git_status_colors = true },
                { "harpoon_index" }, --> This is what actually adds the component in where you want it
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
            end
        },

    },

})
