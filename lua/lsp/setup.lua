-- :h mason-default-settings
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "tailwindcss",
        "bashls",
        "cssls",
        "dockerls",
        "emmet_ls",
        "html",
        "jsonls",
        "pyright",
        "rust_analyzer",
        "yamlls",
        "taplo",
        "gopls",
        "cmake",
        "csharp_ls",
        "sqls",
        "vimls",
        "volar",
        -- "vuels",
        "marksman",
        "clangd",
        "bufls",

    },
})

local lspconfig = require("lspconfig")
local Default = "default"
local servers = {
    sumneko_lua = Default, -- lua/lsp/config/lua.lua
    bashls = Default,
    pyright = Default,
    html = Default,
    cssls = Default,
    tsserver = Default,
    tailwindcss = Default,
    dockerls = Default,
    emmet_ls = Default,
    jsonls = Default,
    rust_analyzer = Default,
    yamlls = Default,
    taplo = Default,
    gopls = Default,
    cmake = Default,
    csharp_ls = Default,
    sqls = Default,
    vimls = Default,
    volar = Default,
    -- vuels = Default,
    marksman = Default,
    clangd = Default,
    bufls = Default,
    --xxx  = require("lsp.config.xxxx")
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
