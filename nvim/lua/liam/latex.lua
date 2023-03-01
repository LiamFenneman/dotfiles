local group = vim.api.nvim_create_augroup('PdfLatex', { clear = true })
local id = nil

vim.api.nvim_create_user_command('PdfLatexEnable', function()
    id = vim.api.nvim_create_autocmd('BufWritePost', {
        command = 'silent !make clean all',
        group = group,
        pattern = '*.tex',
    })
    print('PdfLatex enabled')
end, {})

vim.api.nvim_create_user_command('PdfLatexDisable', function()
    if id ~= nil then
        vim.api.nvim_del_autocmd(id)
        id = nil
        print('PdfLatex disabled')
    end
end, {})
