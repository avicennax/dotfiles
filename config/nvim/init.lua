vim.g.mapleader = ","
  
-- Place backup files in an alternate directory so they don't clutter working space
-- (Make sure the directory exists; it will try each until one works)
-- Currently disabled.
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.directory = {'$HOME/.backup', '$HOME/tmp', '$HOME'}
vim.opt.backupdir = {'$HOME/.backup', '$HOME/tmp', '$HOME'}

-- Visually show TABs and trailing whitespace
vim.opt.listchars = {tab = '» ', trail = '·'}

-- Replace tabs with spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Allows deletion past an append and similar
vim.opt.backspace = {'indent', 'eol', 'start'}

-- Use syntax highlighting/indentation based on filetype
vim.cmd('syntax on')
vim.cmd('filetype indent plugin on')

-- Show line numbers in left column
vim.opt.number = true
vim.cmd('highlight LineNr ctermfg=grey')

-- Always use UTF-8 encoding
vim.opt.encoding = 'utf-8'

-- Don't generate swp files
vim.opt.swapfile = false

-- highlight matches incrementally
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- allow buffers to be hidden
vim.opt.hidden = true

-- no terminal error bells
vim.opt.errorbells = false

-- Increase cmd history length
vim.opt.history = 250

-- Set vim undo stack depth
vim.opt.undolevels = 500

-- Ensure scroll buffer
vim.opt.scrolloff = 8

-- No line wraps
vim.opt.wrap = false

if not vim.g.vscode then
  require("plugins")
  require("remap")
  require("treesitter")
  require("undotree")
  require("filetree")
  require("fugitive")
  require("telescope")
  require("testing")
  vim.cmd.colorscheme("catppuccin")
end
