-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        sections_separatos = '',
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_z = { 'tabs' },
      },
    },
  },

  {
    'vim-test/vim-test',
    keys = {
      { '<leader>tt', '<cmd>TestNearest<cr>', silent = true, desc = 'Test nearest' },
      { '<leader>tT', '<cmd>TestFile<cr>', silent = true, desc = 'Test file' },
      { '<leader>ta', '<cmd>TestSuite<cr>', silent = true, desc = 'Test suite' },
      { '<leader>tl', '<cmd>TestLast<cr>', silent = true, desc = 'Test last test' },
      { '<leader>tg', '<cmd>TestVisit<cr>', silent = true, desc = 'Test visit' },
    },
  },

  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        elixir = { 'credo' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
