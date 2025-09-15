--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- import everything from `kickstart/plugins`
  { import = 'kickstart.plugins' },
  { import = 'kickstart.plugins.lsp' },

  require 'other-stuff.plugins.neo-tree',
  { import = 'custom.plugins' },

  -- [[ colorscheme ]]
  {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme "oxocarbon"
    end,
  },
  'tpope/vim-sleuth',
})
