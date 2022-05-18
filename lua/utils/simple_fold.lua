-- from
-- https://github.com/tamton-aquib/essentials.nvim/blob/54831f61c813cf2fa1ce1c999702b07720fe7a1e/lua/essentials.lua#L78
return {
  simple_fold = function()
    local fs, fe = vim.v.foldstart, vim.v.foldend
    local start_line = vim.fn.getline(fs):gsub("\t", ("\t"):rep(vim.opt.ts:get()))
    local end_line = vim.trim(vim.fn.getline(fe))
    local spaces = (" "):rep(vim.o.columns - start_line:len() - end_line:len() - 7)

    return " " .. start_line .. "  " .. end_line .. spaces
  end,
}
