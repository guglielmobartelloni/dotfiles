return {

  'moll/vim-bbye',

  event = {'BufReadPost', 'BufNewFile'},

  config = function()
    vim.keymap.set('n', '<leader>cc', '<cmd>Bdelete!<return>')
    vim.keymap.set('n', '<leader>ca', '<cmd>bufdo :Bdelete<return>')
  end

}
