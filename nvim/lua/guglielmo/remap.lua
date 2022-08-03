local nnoremap = require("guglielmo.keymap").nnoremap


nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")
nnoremap("<leader>rr", "<cmd>Telescope lsp_references<cr>")



