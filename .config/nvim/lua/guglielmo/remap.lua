local nnoremap = require("guglielmo.keymap").nnoremap
require("toggleterm").setup{
    direction = "float",
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

nnoremap("<leader><leader>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")
nnoremap("<leader>rr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>tt", "<cmd>ToggleTerm<cr>")
nnoremap("<leader>gg", "<cmd>lua _lazygit_toggle()<cr>")
nnoremap("<leader>op", "<cmd>NvimTreeToggle<cr>")





