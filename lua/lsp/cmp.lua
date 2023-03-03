local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    -- 来源
    sources = cmp.config.sources({
        { name = "vsnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "cmp_tabnine" },
        { name = "buffer" },
    }, { { name = "path" } }),
    -- 快捷键
    mapping = require("keybindings").cmp(cmp),
    -- 使用lspkind-nvim显示类型图标
    formatting = require("lsp.ui").formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
        { name = "cmp_tabnine" },
    },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }, {
        { name = "cmp_tabnine" },
    }),
})
