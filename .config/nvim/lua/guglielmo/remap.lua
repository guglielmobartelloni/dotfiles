local nnoremap = require("guglielmo.keymap").nnoremap
local inoremap = require("guglielmo.keymap").inoremap
require("toggleterm").setup{
    direction = "float",
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

local gorun = Terminal:new({ cmd = "go run main.go", })


nnoremap("<leader><leader>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>dl", "<cmd>Telescope diagnostics<cr>")
nnoremap("<leader>rr", "<cmd>Telescope lsp_references<cr>")
nnoremap("<leader>tt", "<cmd>ToggleTerm<cr>")
nnoremap("<leader>gg", "<cmd>lua _lazygit_toggle()<cr>")
nnoremap("<leader>op", "<cmd>NvimTreeToggle<cr>")
--nnoremap("<F7>", function() require("knap").toggle_autopreviewing() end)

nnoremap("<leader>oo", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>")
nnoremap("<leader>olc", ":VimtexCompile<cr>")
nnoremap("<leader>ole", ":VimtexCompile<cr>")
nnoremap("<leader>jj", function()
  vim.fn.setreg("+", require("jsonpath").get())
end)

set_json_path = true
nnoremap("<leader>jo", function()
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
-- vim.keymap.set({ "i", "s" }, "<C-i>", function() require'luasnip'.extras.select_choice() end, { desc = "LuaSnip backward jump" })


