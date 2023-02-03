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
lvim.keys.normal_mode["<leader>zi"] = ":set foldmethod=indent<cr>"
lvim.keys.normal_mode["<leader>zm"] = ":set foldmethod=manual<cr>"
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { silent = true })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { silent = true })


-- vim.api.nvim_set_keymap("n", "s", "", { silent = true })
-- vim.api.nvim_set_keymap("n", "sv", ":vsp<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "sh", ":sp<CR>", { silent = true })
lvim.keys.normal_mode["<leader>jv"] = ":vsp<CR>"
lvim.keys.normal_mode["<leader>jh"] = ":sp<CR>"

-- 把gs展示代码?k息换成 gi  vim.lsp.buf.signatureHelp 是函数
lvim.lsp.buffer_mappings.normal_mode['gs'] = nil
lvim.lsp.buffer_mappings.normal_mode['gi'] = { vim.lsp.buf.signature_help, "Show signatureHelp" }
-- vim.keymap.set({ 'n', 'x', 'o' }, 'gs', "(leap-cross-window)")


vim.api.nvim_set_keymap("n", "<D-s>", "y", { silent = true })
vim.api.nvim_set_keymap("v", "<D-s>", "y", { silent = true })

vim.api.nvim_set_keymap("n", "<D-v>", "p", { silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "p", { silent = true })
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.transparent_window = true
-- lvim.autocommands = {
--     {
--         "BufRead", {
--             -- pattern = { "*.cpp", "*.hpp" },
--             callback = function()
--                 vim.cmd([[
--                 set foldmethod=indent
--                 SymbolsOutline
--                 ]]
--                 )
--             end
--         },
--     }
-- }
-- vim.cmd([[
-- set foldmethod=manual
-- ]])
-- set foldopen=all
-- set foldclose=all
-- -- Change theme settings
lvim.colorscheme = "base16-tokyo-night-terminal-storm" --"base16-onedark" --lunar
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.view.width = 55
lvim.builtin.nvimtree.setup.view.mappings.list = {
    -- 进入下一级
    { key = { "]" }, action = "cd" },
    -- 进入上一级
    { key = { "[" }, action = "dir_up" },
    { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
    { key = "so", action = "system_open" },
    { key = "K", action = "toggle_file_info" },
    { key = ".", action = "toggle_dotfiles" },
    -- v分屏打开文件
    { key = "v", action = "vsplit" },
    -- h分屏打开文件
    { key = "h", action = "split" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
}


-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.alpha.dashboard.config=

lvim.plugins = {

    {
        "ggandor/leap.nvim",
        event = "BufRead",
        config = function()
            require('leap').add_default_mappings()
        end,

    },
    {
        "windwp/nvim-spectre", -- 替换功能
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
        "sindrets/diffview.nvim", -- git 对比 nb
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
        build = "./install.sh",
        dependencies = "hrsh7th/nvim-cmp",
        event = "InsertEnter",
    },
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup({
                position = 'left',
                width = 39,
                auto_preview = true,
                auto_close = true,
                show_relative_numbers = true
            })
            vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<cr>", { silent = true })
        end
    },
    {
        "RRethy/nvim-base16"
    },
    {
        "L3MON4D3/LuaSnip", -- 自定义代码片段
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/Users/keeyu/.config/config/friendly-snippets" } })
        end
    }
    -- {
    --     "Pocco81/auto-save.nvim",
    --     config = function()
    --         require("auto-save").setup()
    --     end,
    -- },
    -- 自动保存太恐怖了
    -- {
    --     "phaazon/hop.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("hop").setup()
    --         vim.api.nvim_set_keymap("n", "<leader>j", ":HopWord<cr>", { silent = true })
    --     end,
    -- },
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
