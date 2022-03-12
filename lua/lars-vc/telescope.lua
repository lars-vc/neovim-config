local telescope = require('telescope')

require('telescope').setup {
    pickers = {
        find_files = {
            path_display = {"truncate"},
            color_devicons=true,
        },
        live_grep = {
            path_display = {"shorten"},
        },
    },
    defaults = {
        layout_config = {
            horizontal = {
                height= 0.95,
                width= 0.95,
            },
            center = {
                height= 0.95,
                width= 0.95,
            }
        },
    },
    mappings = {
        i = {
            ["<C-j>"] = "<C-n>",
            ["<C-k>"] = "<C-p>",
        }
    }
}
require('neoclip').setup {
    enable_persistent_history = true
}
telescope.load_extension('fzf')
