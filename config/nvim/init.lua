require("remap")

if vim.g.vscode then
    local function setup_keybindings()
        dofile(vim.fn.stdpath('config') .. '/lua/vscode.lua')
    end
    vim.defer_fn(setup_keybindings, 3000)
else
    require("plugins")
    vim.cmd.colorscheme("catppuccin")
end
