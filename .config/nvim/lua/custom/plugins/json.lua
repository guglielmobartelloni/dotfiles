return {
  'phelipetls/jsonpath.nvim',
  config = true,
  keys = {
    {
      '<leader>jy',
      function()
        vim.fn.setreg("+", require("jsonpath").get())
      end,
      desc = 'Copy json path',
    },
  },
}
