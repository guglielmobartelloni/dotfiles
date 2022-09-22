vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = 'abdmg'
vim.g.indentLine_setConceal = 0

-- Setup snippets located in .config/nvim/snippets
require("luasnip.loaders.from_snipmate").lazy_load()



