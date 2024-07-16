return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
    },

    config = function()
        local builtin = require('telescope.builtin')
        local function docker_build()
            local user_input = vim.fn.input("Image tag: ")
            vim.cmd("!docker build --tag " .. user_input .. " .")
        end

        local function docker_compose_up()
            vim.cmd("!docker compose down -v; docker compose build; docker compose up -d --force-recreate")
        end

        require('which-key').add({
            { "<leader>d",  group = "Docker" },
            { "<leader>dc", docker_compose_up,                                                                desc = "Docker compose down/build/up" },
            { "<leader>di", docker_build,                                                                     desc = "Build docker image" },
            { "<leader>e",  "<cmd>Neotree toggle<CR>",                                                        desc = "Toggle Neotree" },
            { "<leader>f",  vim.lsp.buf.format,                                                               desc = "Code format" },
            { "<leader>h",  group = "Harpoon" },
            { "<leader>ha", function() require("harpoon.mark").add_file() end,                                desc = "Harpoon add file" },
            { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end,                         desc = "Harpoon quick menu" },
            { "<leader>hn", function() require("harpoon.ui").nav_next(); end,                                 desc = "Harpoon next file" },
            { "<leader>hp", function() require("harpoon.ui").nav_prev(); end,                                 desc = "Harpoon previous file" },
            { "<leader>j",  "<cmd>lprev<CR>zz",                                                               hidden = true },
            { "<leader>k",  "<cmd>lnext<CR>zz",                                                               hidden = true },
            { "<leader>m",  "<cmd>CellularAutomaton make_it_rain<CR>",                                        desc = "Make it rain" },
            { "<leader>p",  group = "Telescope" },
            { "<leader>pf", builtin.find_files,                                                               desc = "Find files" },
            { "<leader>ph", builtin.help_tags,                                                                desc = "Help tags" },
            { "<leader>pp", builtin.buffers,                                                                  desc = "Open buffers" },
            { "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,         desc = "Search string" },
            { "<leader>s",  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",                           desc = "Rename under cursor" },
            { "<leader>t",  group = "Trouble" },
            { "<leader>tn", function() require("trouble").next({ skip_groups = true, jump = true }); end,     desc = "Toggle trouble" },
            { "<leader>tp", function() require("trouble").previous({ skip_groups = true, jump = true }); end, desc = "Toggle trouble" },
            { "<leader>tt", function() require("trouble").toggle() end,                                       desc = "Toggle trouble" },
            { "<leader>u",  "<cmd>UndotreeToggle<CR>",                                                        desc = "Toggle Undotree" },
            { "<leader>y",  '"+y',                                                                            hidden = true },
            {
                "<leader>zz",
                function()
                    require("zen-mode").setup { window = { width = 120, options = {} }, }
                    require("zen-mode").toggle()
                    vim.wo.wrap = false
                    vim.wo.number = false
                    vim.wo.rnu = false
                end,
                desc = "Toggle Zenmode"
            },
            { "<leader>Y", '"+Y', hidden = true }
        })
    end
}
