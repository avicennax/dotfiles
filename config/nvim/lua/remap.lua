-- Vertical / horizonal splits
vim.keymap.set('n', '<leader>vs', ':vsp<CR>', {noremap = true})
vim.keymap.set('n', '<leader>hs', ':sp<CR>', {noremap = true})

-- Clear highlighting
vim.keymap.set('n', '<leader>ch', ':noh<CR>', {noremap = true})

-- ??
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Tab
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', {noremap = true})
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', {noremap = true})

-- Navigation
vim.keymap.set('n', '<C-_>', '<C-o>', { noremap = true })
vim.keymap.set('n', '<C-+>', '<C-i>', { noremap = true })

-- System clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

--- Primagean ---

-- Keep cursor in when appending line below
vim.keymap.set("n", "J", "mzJ`z")

-- Search matches in middle of buffer
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move visual blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy / paste register without overwriting with delete.
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search / Replace on current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x current buffer file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
