-- 如果使用中出现配置的问题，可以使用checkheath检查一下lsp服务器的配置问题
-- lsp日志存在于/home/skt1faker/.local/state/nvim/lsp.log，如果lsp服务器出了问题可以取其中查看。
-- https://github.com/neovim/nvim-lspconfig
-- 看quick-start可以知道如何开启一个lsp服务器
-- 网页下面也有一些教程，

local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

-- :h mason-default-settings
mason.setup({
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
mason_config.setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "clangd",
    "sumneko_lua",
    "pyright"
  },
})


-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.config.lua"),
  clangd = require("lsp.config.clangd"),
  pyright = require("lsp.config.pyright"),

}
--clangd 如何管理c++项目
--需要使用cmake生成compile_command.json，命令如下
-- cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
-- 或者在cmake中加入set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
--https://blog.csdn.net/weixin_43862847/article/details/119274382
--只有makefile可以使用bear make生成compile_command.json
--https://edward852.github.io/post/%E7%94%9F%E6%88%90compile_commands.json%E6%96%87%E4%BB%B6/


for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end
--require("lspconfig").pyright.setup{}
-- require("lsp.ui")
