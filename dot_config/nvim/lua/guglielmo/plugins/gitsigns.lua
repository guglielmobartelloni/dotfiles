return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    keys = {
        { "<leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>" }
    }
}
