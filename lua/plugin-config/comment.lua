local status, comment = pcall(require, "Comment")
if not status then
    vim.notify("没有找到 Comment")
    return
end

local default_opts = {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = "gcc",
        block = "gbc",
    },

    opleader = {
        line = "gc",
        block = "gb",
    },

    extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
    },
    mappings = {
        basic = true,
        extra = false,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
}

-- 关闭了extra快捷键，只用keybindings里定义的基础快捷键
comment.setup(vim.tbl_deep_extend("force", default_opts, require("keybindings").comment))
