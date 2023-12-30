return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  config=function()
    local function db_completion()
      require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
    end
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>db",
      "<cmd>DBUIToggle<cr>",
      { desc = "Toggle the db ui" }
    )
    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"


    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "sql",
      },
      command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "sql",
        "mysql",
        "plsql",
      },
      callback = function()
        vim.schedule(db_completion)
      end,
    })


  end
}
