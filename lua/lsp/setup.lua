local lsp_installer = require("nvim-lsp-installer")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.lang.lua"), -- lua/lsp/lua.lua
  rust_analyzer = require("lsp.lang.rust"),
  jsonls = require("lsp.lang.json"),
  tsserver = require("lsp.lang.ts"),
  remark_ls = require("lsp.lang.markdown"),
  -- html = {},
}
-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local lang = servers[server.name]
  if lang == nil then
    return
  end
  if lang.on_ready then
    lang.on_ready(server)
  else
    server:setup({})
  end
end)
