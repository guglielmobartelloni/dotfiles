return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { '<leader>os', function() require("spectre").toggle() end, desc = 'Open Spectre' },
    }
}
