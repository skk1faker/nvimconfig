local packer = require("packer")
packer.startup(function(use)
	-- Packer 可以管理自己本身
	use("wbthomason/packer.nvim")
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
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- nvim-tree (新增)
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
	-- bufferline (新增)
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
	-- lualine (新增)
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")
	-- telescope （新增）
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
	-- dashboard-nvim (新增)
	-- use("glepnir/dashboard-nvim")
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
  use {
  'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  use {'kenn7/vim-arsync',
      requires = {
          {'prabirshrestha/async.vim'}
      }
  }
	--./.vim-arsync 配置文件
	--remote_host    10.68.12.145
	--remote_user    cuiqing
	--remote_port    22
	--remote_path   /home/cuiqing/swints/wangxinpeng/zhenghaowen
	--local_path      /home/skt1faker/rm/cq
	--ignore_path     ["rm","mm","wprofess_needresult","result_dir","split_pic","empty","split.py"]
	--ignore_dotfiles 1
	--auto_sync_up    1
	--remote_or_local remote
	--sleep_before_sync 0
	--
	--# 如果ignore_path没有需要不访问的地址的话，这里就写为[]就行,否则写为["relative path"]
	--
	--# remote_user username to connect with
	--# remote_passwd password to connect with (requires sshpass) (needed if not using ssh-keys)
	--# remote_port remote ssh port to connect to (default is 22)
	--# local_path local folder to be synced (defaults to folder of .vim-arsync)
	--# ignore_path list of ingored files/folders
	--# ignore_dotfiles set to 1 to not sync dotfiles (e.g. .vim-arsync)
	--# auto_sync_up set to 1 for activating automatic upload syncing on file save
	--# remote_or_local set to 'local' if you want to perform syncing localy
	--# sleep_before_sync set to x seconds if you want to sleep before sync(like compiling a file before syncing)
	--# remote_host remote host to connect (must have ssh enabled)
	--# remote_path remote folder to be synced

	use("mfussenegger/nvim-dap")
	use("sindrets/winshift.nvim")
	-- Lua
	-- TODO:
	-- TODO 如果后面不加冒号是不会进行高亮的
	-- BUG:
	-- WARN:
	-- NOTE:
	-- FIXME:
	-- "ISSUE:"
	--
	-- https://github.com/AmeerTaweel/todo.nvim
	--   use {
	--   "AmeerTaweel/todo.nvim",
	--   requires = "nvim-lua/plenary.nvim",
	--   config = function()
	--       require("todo").setup {
	--           -- your configuration comes here
	--           -- or leave it empty to use the default settings
	--           -- refer to the configuration section below
	--      }
	--      end
	--   } -- todo
	--use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" }) -- 代码格式化,不会用，放弃了：
	use("mhartington/formatter.nvim")
	-- install markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	--	use({
	--		"iamcco/markdown-preview.nvim",
	--		run = "cd app && npm install",
	--		setup = function()
	--			vim.g.mkdp_filetypes = { "markdown" }
	--		end,
	--		ft = { "markdown" },
	--	})
	use("img-paste-devs/img-paste.vim")
	use("voldikss/vim-translator")

	-- Packer
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				-- optional configuration
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
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
