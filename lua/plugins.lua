local packer = require("packer")
packer.startup(
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 你的插件列表...
    -- 主题列表
    -- https://github.com/topics/neovim-colorscheme
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- zephyr 暂时不推荐，详见上边解释
    -- use("glepnir/zephyr-nvim")
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
    -- melange
    use("savq/melange")
    -- catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }
    -- nvim-tree (新增)
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline (新增)
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine (新增)
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope （新增）
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
   -- dashboard-nvim (新增)
    use("glepnir/dashboard-nvim")
    -- project
    -- use("ahmedkhalf/project.nvim")
    -- treesitter （新增）
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- lsp mason
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig" })

    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }lsp 补全引擎
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },当前buffer补全
    use("hrsh7th/cmp-path") -- { name = 'path' }      路径补全
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }命令行补全


    -- 常见编程语言代码段
    -- use("rafamadriz/friendly-snippets")
    use("tveskag/nvim-blame-line")
    -- Lua
    -- TODO:
    -- TODO
    -- BUG:
    -- WARN:
    -- NOTE: 
    -- FIXME:
    -- "ISSUE:"
    -- 
    -- https://github.com/AmeerTaweel/todo.nvim
   use {
   "AmeerTaweel/todo.nvim",
   requires = "nvim-lua/plenary.nvim",
--   config = function()
--       require("todo").setup {
--           -- your configuration comes here
--           -- or leave it empty to use the default settings
--           -- refer to the configuration section below
--      }
--      end
   }
end)

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
--telescope的一个bug导致文件在fold模块生效前被加载，折叠无法生效。
--可以执行zx或者:e等命令来恢复fold功能，缺点是每打开一个文件都需要重来。
--可以自定义autocmd放到plugins.lua里:
pcall(
  vim.cmd,
[[
augroup fold_fix
autocmd!
autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
augroup end
]]
)
