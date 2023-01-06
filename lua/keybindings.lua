local vim = vim
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
-- 插件快捷键
local pluginKeys = {}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 取消 s 默认功能
map("n", "s", "", opt)
-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)
-- windows 分屏快捷键
-- <CR> 表示回车键 --v 左右 h 上下
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- map("n", "<leader>t", ":sp | terminal<CR>", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)
-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
map("v", "<Esc>", "v", opt)
map("v", "u", "", opt)
-- 上下滚动浏览
map("n", "<C-j>", "10j", opt)
map("n", "<C-k>", "10k", opt)
map("v", "<C-j>", "10j", opt)
map("v", "<C-k>", "10k", opt)
-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

map("n", "<leader>u", ":edit!<CR>", opt)

-- bufferline
map("n", "<M-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<M-l>", ":BufferLineCycleNext<CR>", opt)


map("n", "<leader>bj", ":BufferLinePick<CR>", opt)
map("n", "<leader>w", ":Bdelete!<CR>", opt)
-- map("n", "<leader>bw", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
vim.keymap.set("n", "<leader>bc", function()
    vim.cmd("BufferLineCloseRight")
    vim.cmd("BufferLineCloseLeft")
end)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- 最近文件
map("n", "<leader>so", ":Telescope oldfiles<CR>", opt)
-- 快捷键
map("n", "<leader>sk", ":Telescope keymaps<CR>", opt)
-- 命令行
map("n", "<leader>sc", ":Telescope commands<CR>", opt)
-- highlights
local is_highlights = true
vim.keymap.set("n", "<leader>sh", function()
    if is_highlights then
        vim.cmd("set nohlsearch")
    else
        vim.cmd("set hlsearch")
    end
    is_highlights = not is_highlights
end)

--lsp
map("n", "<leader>lt", ":CmpTabnineHub<CR>", opt)
map("n", "<leader>ll", ":CmpTabnineHubUrl<CR>", opt)

map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opt)

map('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

--hop
map("n", "<leader>hh", ":HopWord<CR>", opt)
map("n", "<leader>ha", ":HopAnywhere<CR>", opt)
--git NOTE: git 使用说明 https://github.com/sindrets/diffview.nvim
map("n", "<leader>gl", ":LazyGit<CR>", opt)
--不带参数为全部文件 带参数为单个文件
map("n", "<leader>gh", ":DiffviewFileHistory", opt)
--不带参数对比上一次提交 可以一个参数 也可以两个对比
--origin/main..HEAD 中间两个点分割
--You can also provide additional paths to narrow down what files are shown:
-- :DiffviewOpen HEAD~2 -- lua/diffview plugin
map("n", "<leader>gd", ":DiffviewOpen", opt)
map("", "<leader>gc", ":DiffviewClose<CR>", opt) --关闭
--outline
map("n", "<leader>o", ":SymbolsOutline<CR>", opt)
--replace WARN: nvim-spectre 里面也有定义 就这个除外
map("n", "<leader>rf", "<cmd>lua require('spectre').open_file_search()<CR>", opt)
map("n", "<leader>rp", "<cmd>lua require('spectre').open()<CR>", opt)
map("n", "<leader>ro", "<cmd>lua require('spectre').show_options()<CR>", opt)
map("n", "<leader>rR", "<cmd>lua require('spectre.actions').run_replace()<CR>", opt)
--which-key
map("n", "<leader>k", ":WhichKey<CR>", opt)
--welcome
map("n", "<leader>;", ":Dashboard<CR>", opt)
--markdown
local mPreview, mGlow = false, false

-- map("n", "<leader>mp", ":MarkdownPreview<CR>", opt)
-- map("n", "<leader>mcp", ":MarkdownPreviewStop<CR>", opt)
-- map("n", "<leader>mg", ":Glow<CR>", opt)
-- map("n", "<leader>mcg", ":Glow!<CR>", opt)
vim.keymap.set("n", "<leader>mp", function()
    if not mPreview then
        vim.cmd("MarkdownPreview")
    else
        vim.cmd("MarkdownPreviewStop")
    end
    mPreview = not mPreview

end)
vim.keymap.set("n", "<leader>mg", function()
    if not mGlow then
        vim.cmd("Glow")
    else
        vim.cmd("Glow!")
    end
    mGlow = not mGlow
end)

pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
--todo
map("n", "<leader>cm", ":TodoTelescope<CR>", opt)
--map("n", "", ":HopAnywhere<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    { key = { "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "<CR>", action = "edit" },
    { key = "so", action = "system_open" },
    -- v分屏打开文件
    { key = "v", action = "vsplit" },
    -- h分屏打开文件
    { key = "h", action = "split" },
    -- Ignore (node_modules)
    { key = "i", action = "toggle_ignored" },
    -- Hide (dotfiles)
    { key = ".", action = "toggle_dotfiles" },
    { key = "R", action = "refresh" },
    -- 文件操作
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "I", action = "toggle_file_info" },
    { key = "n", action = "tabnew" },
    -- 进入下一级
    { key = { "]" }, action = "cd" },
    -- 进入上一级
    { key = { "[" }, action = "dir_up" },
}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = "gcc", -- 行注释
        block = "gbc", -- 块注释
    },
    -- Visual 模式
    opleader = {
        line = "gc",
        bock = "gb",
    },
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 自定义代码段跳转到下一个参数
        ["<C-l>"] = cmp.mapping(function(_)
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            end
        end, { "i", "s" }),

        -- 自定义代码段跳转到上一个参数
        ["<C-h>"] = cmp.mapping(function()
            if vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),

        -- Super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" })
        -- end of super Tab
    }
end

pluginKeys.toggleterm = function(ta, tb, tc)
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
end

pluginKeys.todo = function (todo)
    vim.keymap.set("n", "<leader>cj", function()
        todo.jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "<leader>ck", function()
        todo.jump_prev()
    end, { desc = "Previous todo comment" })
end

return pluginKeys
