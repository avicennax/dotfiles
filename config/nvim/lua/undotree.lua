-- Config undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
