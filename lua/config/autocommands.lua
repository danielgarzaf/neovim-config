local filetype_detect = vim.api.nvim_create_augroup("filetype_detect", { clear = true })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    desc = "Interpret files withing pattern as 'C' files",
    group = filetype_detect,
    pattern = {"*.h", "*.he", "*.c", "*.ce"},
    callback = function()
        vim.cmd("setfiletype c")
    end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    desc = "Interpret files withing pattern as a 'groovy' file",
    group = filetype_detect,
    pattern = {"Jenkinsfile"},
    callback = function()
        vim.cmd("setfiletype groovy")
    end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    desc = "Interpret files withing pattern as a 'htmldjango' file",
    group = filetype_detect,
    pattern = {"*.html"},
    callback = function()
        vim.cmd("setfiletype htmldjango")
    end
})
