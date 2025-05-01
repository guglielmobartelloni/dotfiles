return {
  'folke/snacks.nvim',
  opts = {
    gitbrowse = {
      -- your gitbrowse configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  keys = {
    { "<leader>og", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
  }
}
