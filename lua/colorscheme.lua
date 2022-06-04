vim.o.background = "dark"
-- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "gruvbox"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
	return
end
