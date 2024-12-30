local function setup_telescope()
    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            color_devicons = true,

            file_previewer = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            mappings = {
                i = {
                    ["<C-x>"] = false,
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<C-s>"] = actions.file_vsplit,
                    ["<C-l>"] = actions.to_fuzzy_refine,
                },
                n = {
                    ["q"] = actions.close
                },
            }
        },

        extensions = {
            fzf = {}
        }
    }

    require("telescope").load_extension("fzf")

    vim.keymap.set("n", "<leader>e", function()
        local opts = require("telescope.themes").get_ivy({
            cwd = vim.fn.stdpath("config")
        })
        require("telescope.builtin").find_files(opts)
    end)
    vim.keymap.set("n", "<leader>pp", function()
        local opts = require("telescope.themes").get_ivy({
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })
        require("telescope.builtin").find_files(opts)
    end)

    vim.keymap.set("n", "<leader>g", require("telescope.builtin").git_files)
    vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
    vim.keymap.set("n", "\\f", require("telescope.builtin").find_files)
    vim.keymap.set("n", "\\r", require("config.telescope.multigrep").find)
    vim.keymap.set("n", "\\\\", require("telescope.builtin").help_tags)

end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", }
        },
        config = setup_telescope
    },
}
