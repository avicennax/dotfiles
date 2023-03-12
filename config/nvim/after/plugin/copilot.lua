if vim.g.vscode then
    -- If we're in VSCode use the VSCode Copilot plugin.
    vim.cmd('Copilot disable')
else
    -- Toogle disable for nvim until better path solution found.
    vim.cmd('Copilot disable')
end
