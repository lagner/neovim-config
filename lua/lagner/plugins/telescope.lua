return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
        },
    },
    config = function()
        local telescope = require("telescope")
        local keymaps = require("lagner.keymaps")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                },
            },
        })

        telescope.load_extension("fzf")
        keymaps.telescope_keys(require('telescope.builtin'))
    end,
}
