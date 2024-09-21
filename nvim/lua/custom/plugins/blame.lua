return {
  'braxtons12/blame_line.nvim',
  config = function()
    require('blame_line').setup {}
    require('blame_line').disable()
    vim.keymap.set('n', '<leader>gb', ':BlameLineToggle<CR>', { desc = 'Git blame current line' })
  end,
}
