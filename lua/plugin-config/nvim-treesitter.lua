local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter.configs")
    return
end

local ok, install = pcall(require, "nvim-treesitter.install")
if not ok then
    vim.notify("没有找到 nvim-treesitter.install")
    return
end

install.command_extra_args = {
    curl = { "--proxy", "127.0.0.1:7890" },
}

treesitter.setup({
    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = { "cpp", "go", "rust", "toml", "json", "vue",
        "html", "yaml", "sql", "css", "proto", "vim", "lua", "javascript",
        "typescript", "tsx", "markdown", "make", "gomod", "bash" },
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
})


-- 开启 Folding 模块 zc zo
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
