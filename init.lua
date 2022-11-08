-- 基础配置
require("basic")
-- Packer插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置 （新增）
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")  -- 侧边树目录
require("plugin-config.bufferline") -- buffer 显示栏
require("plugin-config.lualine")

require("lsp.setup")
