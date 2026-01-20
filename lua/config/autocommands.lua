local filetype_detect = vim.api.nvim_create_augroup("filetype_detect", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    desc = "Interpret files withing pattern as 'C' files",
    group = filetype_detect,
    pattern = { "*.h", "*.he", "*.c", "*.ce" },
    callback = function()
        vim.cmd("setfiletype c")
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    desc = "Interpret files withing pattern as a 'groovy' file",
    group = filetype_detect,
    pattern = { "Jenkinsfile" },
    callback = function()
        vim.cmd("setfiletype groovy")
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    desc = "Interpret files withing pattern as a 'htmldjango' file",
    group = filetype_detect,
    pattern = { "*.html" },
    callback = function()
        vim.cmd("setfiletype htmldjango")
    end
})


vim.api.nvim_create_autocmd({ "BufWrite" }, {
    desc = "Autoformat XML files",
    group = autoformat_xml,
    pattern = { "*.xml" },
    callback = function()
        vim.cmd([[%! xmllint --format -]])
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})
