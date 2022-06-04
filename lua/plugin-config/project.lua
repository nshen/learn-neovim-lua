-- https://github.com/ahmedkhalf/project.nvim
-- 输出保存目录
-- :lua print(require("project_nvim.utils.path").historyfile)
-- 我的文件在
--  ~/.local/share/nvim/project_nvim/project_history

_G.usePlugin("project_nvim", function (plugin)
	vim.g.nvim_tree_respect_buf_cwd = 1
	plugin.setup({
		detection_methods = { "pattern" },
		patterns = {
			"README.md",
			"Cargo.toml",
			"package.json",
			".go",
			".sln",
			".git",
			"_darcs",
			".hg",
			".bzr",
			".svn",
			"Makefile",
		},
	})
end).after("telescope", function (plugin)

	pcall(plugin.load_extension, "projects")
end)
