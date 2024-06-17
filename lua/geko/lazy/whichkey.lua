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

        require('which-key').register({
            d = {
                name = "Docker",
                i = { docker_build, "Build docker image" },
                c = { docker_compose_up, "Docker compose down/build/up" }

            },
            e = { "<cmd>Neotree toggle<CR>", "Toggle Neotree" },
            f = { vim.lsp.buf.format, "Code format" },
            h = {
                name = "Harpoon",
                a = { function()
                    require("harpoon.mark").add_file()
                end, "Harpoon add file" },
                h = { function()
                    require("harpoon.ui").toggle_quick_menu()
                end, "Harpoon quick menu" },
                n = { function()
                    require("harpoon.ui").nav_next();
                end, "Harpoon next file" },
                p = { function()
                    require("harpoon.ui").nav_prev();
                end, "Harpoon previous file" },
            },
            j = { "<cmd>lprev<CR>zz", "which_key_ignore" },
            k = { "<cmd>lnext<CR>zz", "which_key_ignore" },
            m = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make it rain" },
            p = {
                name = "Telescope",
                f = { builtin.find_files, "Find files" },
                p = { builtin.buffers, "Open buffers" },
                s = { function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end, "Search string" },
                h = { builtin.help_tags, "Help tags" }
            },
            s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Rename under cursor" },
            t = {
                name = "Trouble",
                t = { function()
                    require("trouble").toggle()
                end, "Toggle trouble" },
                n = { function()
                    require("trouble").next({ skip_groups = true, jump = true });
                end, "Toggle trouble" },
                p = { function()
                    require("trouble").previous({ skip_groups = true, jump = true });
                end, "Toggle trouble" },
            },
            u = { "<cmd>UndotreeToggle<CR>", "Toggle Undotree" },
            y = { [["+y]], "which_key_ignore" },
            Y = { [["+Y]], "which_key_ignore" },
            z = {
                z = { function()
                    require("zen-mode").setup {
                        window = {
                            width = 120,
                            options = {}
                        },
                    }
                    require("zen-mode").toggle()
                    vim.wo.wrap = false
                    vim.wo.number = false
                    vim.wo.rnu = false
                end, "Toggle Zenmode" },
            },
        }, { prefix = "<leader>" })
    end
}
