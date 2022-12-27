local vim = vim
local status, toggleterm = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
    return
end


toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
    start_in_insert = true,
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width and height can be a number or function which is passed the current terminal
        -- width = <value>,
        -- height = <value>,
        -- winblend = 3,
    },
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
})

local Terminal = require("toggleterm.terminal").Terminal

local ta = Terminal:new({
    direction = "float",
    close_on_exit = true,
})

local tb = Terminal:new({
    direction = "vertical",
    close_on_exit = true,
})

local tc = Terminal:new({
    direction = "horizontal",
    close_on_exit = true,
})


vim.keymap.set({ "n", "t" }, "<leader>tt", function()
    if ta:is_open() then
        ta:close()
        return
    end
    ta:open()
end)

vim.keymap.set({ "n", "t" }, "<leader>tv", function()
    if tb:is_open() then
        tb:close()
        return
    end
    tb:open()
end)


vim.keymap.set({ "n", "t" }, "<leader>th", function()
    if tc:is_open() then
        tc:close()
        return
    end
    tc:open()
end)

vim.keymap.set({ "n", "t" }, "<leader>tc", function()
    local list = { ta, tb, tc }
    for _, value in ipairs(list) do
        if value:is_open() then
            value:close()
            return
        end
    end
end)
