local vim = vim
local map = vim.api.nvim_set_keymap
--vim.api.nvim_buf_set_keymap()
local opt = { noremap = true, silent = true }

-- 插件快捷键
local pluginKeys = {}


vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 取消 s 回车重复上一次搜索 空格 tab 扩展选择太多的情况 ;往后选择
map("n", "s", "<Plug>(leap-forward-to)", opt)
map("n", "S", "<Plug>(leap-backward-to)", opt)
map("n", "t", "<Plug>(leap-forward-till)", opt) --和其他操作配合
map("n", "T", "<Plug>(leap-backward-till)", opt)
map("n", "gs", "<Plug>(leap-from-window)", opt)

map("n", "<leader>wv", ":vsp<CR>", opt)
map("n", "<leader>wh", ":sp<CR>", opt)
map("n", "<leader>ww", "<C-w>c", opt)
map("n", "<leader>wo", "<C-w>o", opt)

map("n", "<leader>k", ":WhichKey<CR>", opt) --which-key
map("n", "<leader>;", ":Alpha<CR>", opt)    --welcome

-- bufferline
map("n", "<M-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<M-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>bw", ":Bdelete!<CR>", opt)
map("n", "<leader>bf", ":Telescope buffers<CR>", opt)
map("n", "<leader>bj", ":BufferLinePick<CR>", opt)

vim.keymap.set("n", "<leader>bo", function()
    vim.cmd("BufferLineCloseRight")
    vim.cmd("BufferLineCloseLeft")
end)
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)
--NOTE: 增量选择 nvim-treesitter 里面
-- magic search
--map("n", "/", "/\\v", { noremap = true, silent = false })
--map("v", "/", "/\\v", { noremap = true, silent = false })
map("n", "<leader>h", ":let @/ = \"\"<cr>", { noremap = true, silent = true }) -- 取消选择内容
map("v", "p", '"_dP', opt)                                                     -- 在visual 模式里粘贴不要复制
-- visual模式下缩进代码
map("v", "<c-[>", "<gv", opt)
map("v", "<c-]>", ">gv", opt)
map("v", "<Esc>", "v", opt)
-- 上下移动选中文本
map("v", "<M-j>", ":move '>+1<CR>gv-gv", opt)
map("v", "<M-k>", ":move '<-2<CR>gv-gv", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
map("n", "<leader>so", ":Telescope oldfiles<CR>", opt)
map("n", "<leader>sb", ":Telescope buffers<CR>", opt)
map("n", "<leader>sk", ":Telescope keymaps<CR>", opt)
map("n", "<leader>sc", ":Telescope commands<CR>", opt)
map("n", "<leader>sp", ":Telescope projects<CR>", opt)
map("n", "<leader>ss", ":Telescope lsp_document_symbols<CR>", opt)
map("n", "<leader>sm", ":TodoTelescope<CR>", opt)  --todo
--map("n", "<leader>ee", ":NvimTreeToggle<CR>", opt) --file tree

vim.keymap.set("n", "<leader>e", function()
    require("ranger-nvim").open(true)
end)

pluginKeys.todo = function(todo)
    vim.keymap.set("n", "<leader>mj", function()
        todo.jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "<leader>mk", function()
        todo.jump_prev()
    end, { desc = "Previous todo comment" })
end
--lsp
-- map("n", "<leader>lt", ":CmpTabnineHub<CR>", opt)
-- map("n", "<leader>ll", ":CmpTabnineHubUrl<CR>", opt)
map("n", "<tab>", "<c-]>", opt) -- <cmd>lua vim.lsp.buf.declaration()<CR>
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opt)

map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opt)

map("n", "<leader>lr", ":Telescope lsp_references<CR>", opt)

map("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
map("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)

map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", opt)


--git NOTE: git 使用说明 https://github.com/sindrets/diffview.nvim
--不带参数为全部文件 带参数为单个文件
map("n", "<leader>gh", ":DiffviewFileHistory", opt)
--不带参数对比上一次提交 可以一个参数 也可以两个对比
--origin/main..HEAD 中间两个点分割
--You can also provide additional paths to narrow down what files are shown:
-- :DiffviewOpen HEAD~2 -- lua/diffview plugin
map("n", "<leader>gd", ":DiffviewOpen", opt)
map("", "<leader>gc", ":DiffviewClose<CR>", opt) --关闭

--replace WARN: nvim-spectre 里面也有定义 就这个除外
map("n", "<leader>rn", ":Lspsaga rename<CR>", opt)
map("n", "<leader>rf", "<cmd>lua require('spectre').open_file_search()<CR>", opt)
map("n", "<leader>rp", "<cmd>lua require('spectre').open()<CR>", opt)
map("n", "<leader>ro", "<cmd>lua require('spectre').show_options()<CR>", opt)
map("n", "<leader>rR", "<cmd>lua require('spectre.actions').run_replace()<CR>", opt)



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
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}


-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = "gcc",  -- 行注释
        block = "gbc", -- 块注释
    },
    -- Visual 模式
    opleader = {
        line = "gc",
        bock = "gb",
    },
}
-- ctrl + /
map("n", "<C-/>", "gcc", { noremap = false })
map("v", "<C-/>", "gcc", { noremap = false })

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

pluginKeys.toggleterm = function(ta)
    vim.keymap.set({ "n", "t" }, "<c-\\>", function()
        if ta:is_open() then
            ta:close()
            return
        end
        ta:open()
    end)
end
return pluginKeys
