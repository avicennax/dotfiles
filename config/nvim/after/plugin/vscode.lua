-- Create a new command `Code` that will open VSCode with supplied
-- arguments; if none are passed use the current file.
vim.cmd("command! -nargs=? Code call v:lua.OpenVsCode(<f-args>)")

-- Define the Lua function that will open VSCode
function OpenVsCode(path)
  local filepath = path or vim.fn.expand('%')
  vim.fn.system('code ' .. filepath)
end

if vim.g.vscode then
  local function notify(cmd)
      return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
  end
    
  -- Splitting
  vim.keymap.set('n', '<leader>vs', notify 'workbench.action.splitEditorRight', {noremap = true})
  vim.keymap.set('n', '<leader>hs', notify 'workbench.action.splitEditorUp', {noremap = true})

  -- Telescope 
  vim.keymap.set('n', '<leader>ff', notify 'workbench.action.quickOpen', {}) -- find files
  vim.keymap.set('n', '<leader>fg', notify 'workbench.action.findInFiles', { silent = true })
  
  -- Git
  vim.keymap.set('n', '<leader>gs', notify 'workbench.view.scm', { silent = true })
  
  -- nvim-tree
  vim.keymap.set('n', '<leader>tf', notify 'workbench.view.explorer', { silent = true })

  print("Loading VSCode mappings!")
end
