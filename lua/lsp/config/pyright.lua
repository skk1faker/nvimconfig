-- 如果使用中出现配置的问题，可以使用checkheath检查一下lsp服务器的配置问题
-- 虚拟环境打开之后直接就能定位到你找的包
local common = require("lsp.common-config")

local util = require("lspconfig").util
local opts = {
	capabilities = common.capabilities,
	root_dir = util.find_git_ancestor(), -- root_dir 使用“:h lspconfig-root-detection”查看pyright如何配置
  --root_dir = util.root_pattern('pyproject.toml', 'requirements.txt'),
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.disableFormat(client)
		common.keyAttach(bufnr)
	end,
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
