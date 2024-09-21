return {
  'danymat/neogen',
  config = true,
  keys = {
    {
      '<leader>cg',
      function()
        require('neogen').generate()
      end,
      desc = 'Generate docs from this function or block',
    },
  },
}
