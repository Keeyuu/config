--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.showmode = true
-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = { "*" },
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["q"] = ":bdelete<cr>"
--lvim.keys.normal_mode["\""] = ":reg<cr>"
lvim.keys.normal_mode["<M-h>"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<M-l>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<leader>ss"] = ":Telescope live_grep<cr>"
lvim.keys.normal_mode["<leader>u"] = ":edit!<cr>"
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { silent = true })
vim.api.nvim_set_keymap("n", "s", "", { silent = true })

vim.api.nvim_set_keymap("n", "sv", ":vsp<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "sh", ":sp<CR>", { silent = true })


vim.api.nvim_set_keymap("n", "<D-s>", "y", { silent = true })
vim.api.nvim_set_keymap("v", "<D-s>", "y", { silent = true })

vim.api.nvim_set_keymap("n", "<D-v>", "p", { silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "p", { silent = true })
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- neovide
vim.cmd([[
let g:neovide_input_macos_alt_is_meta = v:true
set guifont=MesloLGL\ Nerd\ Font\ Mono:h13
let g:neovide_cursor_vfx_mode = "sonicboom"
set foldmethod=indent
let g:neovide_transparency = 0.85
let g:neovide_refresh_rate = 90
let g:neovide_refresh_rate_idle = 3
]]
)
-- set foldopen=all
-- set foldclose=all
-- -- Change theme settings
lvim.colorscheme = "base16-onedark" --lunar
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.view.width = 45

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.alpha.dashboard.config=

lvim.plugins = {
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "<leader>j", ":HopWord<cr>", { silent = true })
        end,
    },
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
            vim.api.nvim_set_keymap("n", "<leader>rf", "<cmd>lua require('spectre').open_file_search()<CR>",
                { silent = true })
            vim.api.nvim_set_keymap("n", "<leader>rp", "<cmd>lua require('spectre').open()<CR>", { silent = true })
            vim.api.nvim_set_keymap("n", "<leader>ro", "<cmd>lua require('spectre').show_options()<CR>",
                { silent = true })
            vim.api.nvim_set_keymap("n", "<leader>rR", "<cmd>lua require('spectre.actions').run_replace()<CR>",
                { silent = true })
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    {
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    {
        "tpope/vim-surround",
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
            vim.api.nvim_set_keymap("n", "<leader>m", ":TodoTelescope<CR>", { silent = true })

        end,
    },
    {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup({
                position = 'right',
                width = 25,
            })
            vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<cr>", { silent = true })
        end
    },
    {
        "RRethy/nvim-base16"
    }
    -- {
    --     "Pocco81/auto-save.nvim",
    --     config = function()
    --         require("auto-save").setup()
    --     end,
    -- },
    -- 自动保存太恐怖了
}


-- lvim.autocommands = {
--     {
--         "BufEnter", -- see `:h autocmd-events`
--         { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
--             pattern = { "*.go", "*.lua" }, -- see `:h autocmd-events`
--             command = "za",
--         }
--     },
-- }
