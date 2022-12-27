-- https://github.com/nvim-pack/nvim-spectre
-- WARN: spectre 手动安装依赖项 sed 和 ripgrep
-- sed 命令（自行安装，如果已有则忽略）
-- repgrep： https://github.com/BurntSushi/ripgrep
local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
    vim.notify("spectre not found!")
    return
end

spectre.setup({
    highlight      = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete"
    },
    mapping        = {
        ['toggle_line'] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle current item"
        },
        ['enter_file'] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
            desc = "goto current file"
        },
        ['send_to_qf'] = {
            map = "<leader>rq",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
        },
        --['replace_cmd'] = {
        --    map = "<leader>rc",
        --    cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        --    desc = "input replace vim command"
        --},
        ['show_option_menu'] = {
            map = "<leader>ro",
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = "show option"
        },
        ['run_current_replace'] = {
            map = "<leader>rc",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line"
        },
        ['run_replace'] = {
            map = "<leader>R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
        },
        ['change_view_mode'] = {
            map = "<leader>rv",
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = "change result view mode"
        },
        ['resume_last_search'] = {
            map = "<leader>rl",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "resume last search before close"
        },
        -- you can put your mapping here it only use normal mode
    },
    is_insert_mode = true -- start open panel on is_insert_mode
})
