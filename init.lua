local vim = vim
require("basic")

require("keybindings")

require("plugins")
require("colorscheme")
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.telescope")
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

