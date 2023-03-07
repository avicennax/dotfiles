-- Since we've disabled netrw for filetree + telescope
-- we need to redefine Browse command.
function browse(url)
  os.execute('open ' .. vim.fn.shellescape(url))
end

vim.cmd('command! -nargs=1 Browse silent lua browse(<f-args>)')

vim.g.github_enterprise_urls = {'https://gh.riotgames.com'}

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gbr", ":GBrowse<CR>")
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")


