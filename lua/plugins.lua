local vim = vim
local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use "wbthomason/packer.nvim"
        --------------------- colorschemes --------------------
        -- tokyonight
        use("RRethy/nvim-base16")
        --------------------- leap --------------------
        use { 'ggandor/leap.nvim', config = function()
            -- require('leap').add_default_mappings()
        end }
        -----------------------文件树------------------
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -----------------------标签页-----------------
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        ------------------------底部状态栏----------------
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        ----------------------搜索-------------------
        use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
        ----------------------启动页面-------------------
        use {
            'glepnir/dashboard-nvim',
            event = 'VimEnter',
            config = function()
                require('dashboard').setup {
                }
            end,
            requires = { 'nvim-tree/nvim-web-devicons' }
        }
        ----------------------项目-------------------
        use("ahmedkhalf/project.nvim")
        ---------------------高亮--------------彩色括号------
        use({ "nvim-treesitter/nvim-treesitter", requires = { 'p00f/nvim-ts-rainbow' }, run = ":TSUpdate" })
        ---------------------注释--------------------
        use("numToStr/Comment.nvim")
        ---------------------mason--------------------
        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "ray-x/lsp_signature.nvim" --函数参数提示加强
        }
        ---------------------补全引擎--------------------
        use("hrsh7th/vim-vsnip")
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- 补全源
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
        -- ui 补全图标显示
        use("onsails/lspkind-nvim")
        -----------------------代码快辅助线------------------
        use("lukas-reineke/indent-blankline.nvim")
        -----------------------------------------
        use("tami5/lspsaga.nvim")
        -----------------------自动括号------------------
        use("windwp/nvim-autopairs")
        ----------------------surround------------------
        use("ur4ltz/surround.nvim")
        ----------------------which-key------------------
        use("folke/which-key.nvim")
        ----------------------toggleterm------------------
        use("akinsho/toggleterm.nvim")
        ----------------------todo------------------
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
        }
        ----------------------spectre------------------
        use {
            "windwp/nvim-spectre",
            requires = "nvim-lua/plenary.nvim"
        }
        ----------------------md------------------
        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })
        ----------------------lastplace-----------------
        use 'ethanholz/nvim-lastplace'
        ----------------------diffview------------------
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    end,
    config = {
        display = {
            -- 并发数限制
            max_jobs = 8,
            -- 以浮动窗口打开安装列表
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})







-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
