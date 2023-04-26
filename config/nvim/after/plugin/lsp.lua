if not vim.g.vscode then
  local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
  })

  lsp.ensure_installed({
    'rust_analyzer',
    'eslint',
    'tsserver',
    'gopls',
    'pyright'
  })

  require("lspconfig").rust_analyzer.setup({
    settings = {
      ["rust-analyzer"] = {
        procMacro = {
          enable = true
        }
      }
    }
  })

  -- (Optional) Configure lua language server for neovim
  lsp.nvim_workspace()

  lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- Actions
    vim.keymap.set("n", "<leader>g", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>fd", function() vim.lsp.buf.format() end, opts)

    -- Diagnostics
    vim.keymap.set("n", "<leader>do", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end)

  lsp.setup()
end
