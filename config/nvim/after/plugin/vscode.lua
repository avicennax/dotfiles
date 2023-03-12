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

  -- Harpoon / VSCode Bookmarks
  vim.keymap.set('n', '<leader>a', notify 'bookmarks.toggle', { silent = true })
  -- Currently just using VSCode native binding since <C-e>
  -- vim.keymap.set('n', '<leader>a', notify 'bookmarksExplorer.focus', { silent = true })
  
  -- Don't currently have this functionality Harpoon
  vim.keymap.set('n', '<leader>b', notify 'bookmarks.list', { silent = true })

  -- LSP
  vim.keymap.set('n', '<leader>g', notify 'editor.action.revealDefinition', { silent = true })
  vim.keymap.set('n', '<leader>gd', notify 'editor.action.revealDefinition', { silent = true })
  vim.keymap.set('n', '<leader>gr', notify 'editor.action.goToReferences', { silent = true })
  vim.keymap.set('n', '<leader>gi', notify 'editor.action.goToImplementation', { silent = true })
  vim.keymap.set("n", "<leader>ca", notify 'editor.action.sourceAction', { silent = true })

  print("Loading VSCode mappings!")
end
