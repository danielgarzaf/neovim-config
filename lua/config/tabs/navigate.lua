local M = {}

local index_of = function(list, el)
    local index = {}
    for key, value in pairs(list) do
        index[value] = key
    end
    return index[el]
end


M.move_left = function()
    local tabpages = vim.api.nvim_list_tabpages()
    local curr_tab = vim.api.nvim_get_current_tabpage()
    local i = index_of(tabpages, curr_tab)
    if i - 1 < 1 then
        i = #tabpages
    else
        i = i - 1
    end

    vim.api.nvim_set_current_tabpage(tabpages[i])
end

M.move_right = function()
    local tabpages = vim.api.nvim_list_tabpages()
    local curr_tab = vim.api.nvim_get_current_tabpage()
    local i = index_of(tabpages, curr_tab)
    if i + 1 > #tabpages then
        i = 1
    else
        i = i + 1
    end

    vim.api.nvim_set_current_tabpage(tabpages[i])
end


return M
