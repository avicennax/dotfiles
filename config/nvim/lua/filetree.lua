-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- open at startup
local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
    
  -- switch focus to previous window (if possible)
  local nr_windows = #vim.api.nvim_list_wins()
  if nr_windows > 1 then
    vim.cmd([[wincmd p]])
  end
end

if vim.g.notree == nil then
  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree }) 
end

-- nvim-tree keybinding
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
