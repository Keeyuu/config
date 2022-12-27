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
        "taplo",
        "yamlls",
        "gopls",
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
    taplo = Default,
    yamlls = Default,
    gopls = Default,
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
