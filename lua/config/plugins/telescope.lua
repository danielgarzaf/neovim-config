local function setup_telescope()
    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = '> ',
            color_devicons = true,

            file_previewer = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            mappings = {
                i = {
                    ["<C-x>"] = false,
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<C-s>"] = actions.file_vsplit,
                },
                n = {
                    ["q"] = actions.close
                },
            }
        }
    }

    vim.keymap.set("n", "<leader>e", function()
        local opts = require("telescope.themes").get_ivy({
            cwd = vim.fn.stdpath("config")
        })
        require("telescope.builtin").find_files(opts)
    end)
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
