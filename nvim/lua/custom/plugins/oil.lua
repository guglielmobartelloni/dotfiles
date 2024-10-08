return {
  'stevearc/oil.nvim',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return vim.startswith(name, '.DS_Store')
      end,
    },
    float = { padding = 4 },
  },
  config = function(_, opts)
    local oil = require 'oil'
    oil.setup(opts)
    vim.keymap.set('n', '-', oil.open, { desc = 'Open parent directory' })
  end,
}
