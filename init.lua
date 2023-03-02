local vim = vim
require("basic")
require("keybindings")

require("plugins")
require("colorscheme")
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.comment")
require("plugin-config.bufferline")
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("lsp.lsp_signature")
require("lsp.cmp_tabnine")
require("plugin-config.indent-blankline")
require("plugin-config.nvim-autopairs")
require("plugin-config.surround") -- ysiw" ys$"  ds" cs"' t代表html标签 可以直接干掉标签
require("plugin-config.which-key")
require("plugin-config.toggleterm")
require("plugin-config.todo-comments")
require("plugin-config.nvim-spectre")
require("plugin-config.nvim-lastplace")
-- require("plugin-config.gitsigns") --没什么吊用感觉
--require("lsp.null-ls") 语言lsp自带的感觉就很好
-- 我们希望进入 Normal 模式时自动切换为英文输入法，而进入到 Insert 模式时切换回之前输入时所用的输入法。
local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true, })
local autocmd = vim.api.nvim_create_autocmd
-- 自动切换输入法
autocmd("InsertLeave", {
    group = myAutoGroup,
    callback = require("utils.im-select").macInsertLeave,
})
autocmd("InsertEnter", {
    group = myAutoGroup,
    callback = require("utils.im-select").macInsertEnter,
})
