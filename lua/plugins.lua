-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/

-- 自动安装 Packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    -- "https://github.com/wbthomason/packer.nvim",
    "https://github.com.cnpmjs.org/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end


-- Use a protected call so we don't error out on first use
 local status_ok, packer = pcall(require, "packer")
 if not status_ok then
 vim.notify("没有安装 packer.nvim")
  return
 end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    use 'shaunsingh/nord.nvim'

    if paccker_bootstrap then
      packer.sync()
    end
  end,
  config = {
    max_jobs = 16,
    -- 自定义源
    git = {
      default_url_format = "https://github.com.cnpmjs.org/%s",
      -- default_url_format = "https://hub.fastgit.org/%s",
      -- default_url_format = "https://codechina.csdn.net/mirrors/%s",
    },
    -- display = {
    --   open_fn = function()
    --     return require("packer.util").float({ border = "single" })
    --   end,
    -- },
  },
})

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

