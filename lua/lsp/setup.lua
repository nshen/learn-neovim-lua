-- local lsp_installer = require("nvim-lsp-installer")
require("nvim-lsp-installer").setup({
	-- 自动安装 Language Servers
	automatic_installation = true,
})
local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	"sumneko_lua",
	"bashls",
	"pyright",
	"html",
	"cssls",
	"jsonls",
	"tsserver",
	"yamlls",
	"remark_ls",
	"gopls",
	"dartls",
}

for _, server in pairs(servers) do
	_G.usePlugin("lsp.config." .. server, function(config)
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[server])
	end, true).fail(function()
		-- 使用默认参数
		lspconfig[server].setup({
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				-- 禁用格式化功能，交给专门插件插件处理
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false

				-- 绑定快捷键
				require("keybindings").mapLSP(function(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end)
			end,
		})
	end)
end
