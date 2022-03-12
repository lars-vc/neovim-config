local telescope = require('telescope')

telescope.setup {
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
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
        },
        n = {
            ["<C-c>"] = require('telescope.actions').close,
        }
    }
}

telescope.load_extension('fzf')

require('neoclip').setup {
    enable_persistent_history = true
}

