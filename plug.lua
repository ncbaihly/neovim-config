--[[ plug.lua  ]]

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.plug(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost plug.lua PackerCompile
augroup end
]]

use = require("packer").use
require("packer").startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP Client
  use 'neovim/nvim-lspconfig'

  -- Language Server installer
  use {
    'williamboman/nvim-lsp-installer',
    requires = 'neovim/nvim-lspconfig',
  }

  -- Show VSCode-esque pictograms
  use 'onsails/lspkind-nvim'
  -- show various elements of LSP as UI
  use {'tami5/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}
end)


