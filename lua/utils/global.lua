function _G.log(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

function _G.requirePlugin(name)
	local status_ok, plugin = pcall(require, name)
	if not status_ok then
		vim.notify(" 没有找到插件：" .. name)
		return nil
	end
	return plugin
end

---@param name string
---@param handler function
---@paran silence bool
function _G.usePlugin(name, handler, silence)
	local status_ok, plugin = pcall(require, name)
	if not status_ok then
		if not silence then
			vim.notify(" 没有找到插件：" .. name)
		end
	else
		handler(plugin)
	end
	return setmetatable({}, {
		__index = {
			after = function(name, handler)
				if not status_ok then
					return
				end
				return _G.usePlugin(name, handler, silence)
			end,
			fail = function(handler)
				if status_ok then
					return
				end
				handler()
			end,
		},
	})
end

function _G.lspCap()
	print(vim.inspect(vim.lsp.buf_get_clients()[1].resolved_capabilities))
end
