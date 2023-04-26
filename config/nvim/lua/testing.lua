local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python"),
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s", "-tags=integration" }
    }),
  },
})


vim.keymap.set('n', '<leader>rt', function () neotest.run.run() end, { silent = true })
vim.keymap.set('n', '<leader>to', function () neotest.output.open({ enter = true }) end, { silent = true })
vim.keymap.set('n', '<leader>tst', function () neotest.summary.toggle() end, { silent = true })
vim.keymap.set('n', '<leader>rtf', function () neotest.run.run(vim.fn.expand("%")) end, { silent = true })
