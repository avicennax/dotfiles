local M = {}

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Enable Harpoon search inside filetree window
function M.on_attach(bufnr)
  vim.keymap.set('n', '<C-e>', require("harpoon.ui").toggle_quick_menu, {buffer = bufnr, noremap = true, silent = true, nowait = true })
end

require("nvim-tree").setup({
   on_attach = M.on_attach
})

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

local function is_file_buffer()
  local bufnr = vim.fn.bufnr()
  local filetype = vim.fn.getbufvar(bufnr, 'filetype')
  return filetype ~= nil
end

local function on_bufenter()
  if is_file_buffer() then
    vim.cmd(":NvimTreeFindFile")
  end
end

if vim.g.notree == nil then
   vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree }) 
  -- (TODO) Debug
  -- vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = on_bufenter }) 
else
  -- (TODO) Is there a better way to do this?
  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function() require("nvim-tree.api").tree.close() end })
end

-- nvim-tree keybinding
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tff', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
