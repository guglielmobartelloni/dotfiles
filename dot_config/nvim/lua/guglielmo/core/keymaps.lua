-- set leader key to space
vim.g.mapleader = " "

-- Define a variable to keep track of the toggle state
local isCommandEnabled = false
-- Define the command you want to toggle
function ToggleQuickFix()
    if isCommandEnabled then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
    -- Toggle the state
    isCommandEnabled = not isCommandEnabled
end

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- for visual editing
keymap.set("n", "j", "gj", { desc = "" })
keymap.set("n", "k", "gk", { desc = "" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Quickfix list
keymap.set("n", "<leader>q", ":lua ToggleQuickFix()<CR>", { desc = "Open quickfix list" })
keymap.set("n", "[q", ":cprev<CR>", { desc = "Prev quickfix" })
keymap.set("n", "]q", ":cnext<CR>", { desc = "Next quickfix" })

keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clip" })
keymap.set("n", "<leader>y", '"+y', { desc = "Copy from system clip" })

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
