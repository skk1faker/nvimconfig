-- 基础配置
require("basic")
-- Packer插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置 （新增）
require("colorscheme")
-- 插件配置
-- require("plugin-config.nvim-tree") -- 侧边树目录
require("plugin-config.bufferline") -- buffer 显示栏
require("plugin-config.lualine")
--require("plugin-config.telescope")
--require("plugin-config.dashboard")
-- require("plugin-config.project")
--有时候会发现 project 列表并不是我常用的项目列表，列出了很多没用的项目，这时候就需要手动编辑 project_history 列表了
--:lua print(require("project_nvim.utils.path").historyfile) 就可以看到 project_history 文件的路径了
require("plugin-config.nvim-treesitter")
require("plugin-config.blameline")
require("plugin-config.symbols-outline")
require("plugin-config.winshift")
require("plugin-config.markdown_preview")
--require("plugin-config.keysound")
require("plugin-config.translate")

--require("plugin-config.todo") -- 编辑的时候另起一行然后<C-c>会报错
require("lsp.setup")
require("lsp.cmp")
-- require("lsp.null-ls")
require("lsp.formatter")
require("endsetting")
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
vim.cmd('highlight Visual ctermbg=Black ctermfg=White guibg=Black guifg=White')

