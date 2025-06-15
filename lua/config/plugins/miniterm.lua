local terms = {}

local function config()
    local command = vim.api.nvim_create_user_command

    command("TermToggle", function(opts)
        local nth_term_str = unpack(opts.fargs)
        if nth_term_str == nil then nth_term_str = "1" end

        local nth_term = tonumber(nth_term_str)
        -- All but the first terminal need to be created manually
        if nth_term > 1 and nth_term > #terms then
            error("Terminal n. " .. nth_term .. " doesn't exist")
        end

        local term = terms[nth_term]
        -- First terminal only
        if term == nil then
            term = require("miniterm.terminal").new({
                height_percentage = 0.40
            })
            table.insert(terms, term)
        end
        term:toggle()
    end, { nargs = "*" })

    command("TermNew", function()
        table.insert(terms, require("miniterm.terminal").new({ floating = false }))
    end, { nargs = "*" })

    command("TermLog", function()
        vim.print(terms)
    end, { nargs = "*" })

    -- Mappings
    vim.keymap.set("t", "<C-[>", "<C-\\><C-N>")
    vim.keymap.set("t", "<esc>", "<C-\\><C-N>")

    vim.keymap.set("n", "<M-2>", "<esc>:TermToggle<CR>")
    vim.keymap.set("i", "<M-2>", "<esc>:TermToggle<CR>")
    vim.keymap.set("t", "<M-2>", "<C-\\><C-N>:TermToggle<CR>")
end


return {
    {
        'danielgarzaf/miniterm.nvim',
        config = config
    }
}
