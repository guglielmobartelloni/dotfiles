local nnoremap = require("guglielmo.keymap").nnoremap

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")
nnoremap("<leader>rr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader><leader>", "<cmd>ToggleTerm direction=float<cr>")
nnoremap("<leader>gg", "<cmd>lua _lazygit_toggle()<cr>")





