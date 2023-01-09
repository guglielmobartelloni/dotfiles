local nnoremap = require("guglielmo.keymap").nnoremap
local nmap = require("guglielmo.keymap").nmap
-- local inoremap = require("guglielmo.keymap").inoremap
require("toggleterm").setup{
    direction = "float",
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function Lazygit_toggle()
  lazygit:toggle()
end

-- local gorun = Terminal:new({ cmd = "go run main.go", })


nnoremap("<leader><leader>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>ff", vim.lsp.buf.format)
-- nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")
nnoremap("<leader>rr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>tt", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>gg", "<cmd>lua Lazygit_toggle()<cr>")
nnoremap("<leader>op", "<cmd>NvimTreeToggle<cr>")

nnoremap("<leader>oo", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>")
nnoremap("<leader>olc", ":VimtexCompile<cr>:set wrap<cr>")

-- Change local compilation for vimtex
nmap("<leader>oll", "<plug>(vimtex-toggle-main)")

nnoremap("<leader>ojc", function()
  vim.fn.setreg("+", require("jsonpath").get())
  print('JsonPath saved to the clipboard')
end)

local set_json_path = true
nnoremap("<leader>oj", function()
    if set_json_path then
        vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
        set_json_path=false
    else
        vim.opt_local.winbar = ""
        set_json_path=true
    end
end)



nnoremap("<leader>ss", function()
    vim.o.spell = not vim.o.spell
    print("spell: " .. tostring(vim.o.spell))
end)


vim.api.nvim_exec([[
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
]], false)

vim.api.nvim_exec([[
noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')
]], false)


local is_diagnostics_active = true
nnoremap("<leader>dt", function()
    if is_diagnostics_active then
        vim.diagnostic.enable()
        is_diagnostics_active=false
    else
        vim.diagnostic.disable()
        is_diagnostics_active=true
    end
end)

