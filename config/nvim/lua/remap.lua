-- Vertical / horizonal splits
vim.keymap.set('n', '<leader>vs', ':vsp<CR>', {noremap = true})
vim.keymap.set('n', '<leader>hs', ':sp<CR>', {noremap = true})

-- Clear highlighting
vim.keymap.set('n', '<leader>ch', ':noh<CR>', {noremap = true})

-- ??
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)