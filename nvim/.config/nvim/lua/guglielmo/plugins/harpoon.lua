return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>ha",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set(
      "n",
      "<leader>hm",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Go to file 1" })
    keymap.set("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Go to file 2" })
    keymap.set("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Go to file 3" })
  end,
}
