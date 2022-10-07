-- Setup snippets located in .config/nvim/snippets
-- require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
local ls = require("luasnip")
ls.config.set_config{
    history = true,
    enable_autosnippets=true,
	updateevents = "TextChanged,TextChangedI", --update changes as you type
    store_selection_keys = "<Tab>"
}

-- Command to enter directly on the line for quick snippets editing
-- vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])

