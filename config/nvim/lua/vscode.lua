local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

keymap('n', '<leader>ff', notify 'workbench.action.quickOpen', {}) -- find files
keymap('n', '<leader>rg', notify 'workbench.action.findInFiles', { silent = true })

print("Loading VSCode mappings!")