if vim.bo.filetype == json then
  vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
end
