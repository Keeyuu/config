-- place this in one of your configuration file(s)
local status, hop = pcall(require, "hop")
local vim = vim
if not status then
    vim.notify("没有找到 dashboard")
    return
end

--Hop doesn’t set any keybindings; you will have to define them by yourself.
--If you want to create a key binding from within Lua:
--local directions = require('hop.hint').HintDirection
--vim.keymap.set('', 'f', function()
--    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
--end, { remap = true })
--vim.keymap.set('', 'F', function()
--    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
--end, { remap = true })
--vim.keymap.set('', 't', function()
--    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
--end, { remap = true })
--vim.keymap.set('', 'T', function()
--    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
--end, { remap = true })

hop.setup()
