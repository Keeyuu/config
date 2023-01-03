local vim = vim
local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use "wbthomason/packer.nvim"
        --------------------- colorschemes --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        use("ray-x/aurora")
        use("RRethy/nvim-base16")
        ---other
        -----------------------文件树------------------
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -----------------------标签页-----------------
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        ------------------------底部状态栏----------------
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        ----------------------搜索-------------------
        -- use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
        ----------------------启动页面-------------------
        use("glepnir/dashboard-nvim")
        ----------------------项目-------------------
        use("ahmedkhalf/project.nvim")
        ---------------------高亮--------------------
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
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
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        use("p00f/nvim-ts-rainbow")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        -- ui 补全图标显示
        use("onsails/lspkind-nvim")
        -----------------------代码快辅助线------------------
        use("lukas-reineke/indent-blankline.nvim")
        -----------------------------------------
        use("tami5/lspsaga.nvim")
        -- 代码格式化
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -----------------------自动括号------------------
        use("windwp/nvim-autopairs")
        ----------------------surround------------------
        use("ur4ltz/surround.nvim")
        ----------------------outline------------------
        use 'simrat39/symbols-outline.nvim'
        ----------------------hop------------------
        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
        }
        ----------------------which-key------------------
        use("folke/which-key.nvim")
        -----------------------gitsigns-----------------
        -- use("lewis6991/gitsigns.nvim")
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
        use { "ellisonleao/glow.nvim" }
        ----------------------lastplace-----------------
        use 'ethanholz/nvim-lastplace'
        ----------------------lazygit-------------------
        use({
            "nvim-telescope/telescope.nvim",
            requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
            config = function()
                require("telescope").load_extension("lazygit")
            end,
        })
        ----------------------diffview------------------
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
        ----------------------autosave------------------
        use({
            "Pocco81/auto-save.nvim",
            config = function()
                require("auto-save").setup {
                    -- your config goes here
                    -- or just leave it empty :)
                }
            end,
        })

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
