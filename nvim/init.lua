-- Settings
require('settings')

-- Plugins
require('packer-plugins')

-- Gruvbox
require('gruvbox')

-- Lualine
require('lualine').setup()

-- LSP 
require('mason').setup()
require('mason-lspconfig').setup()
require('lspconfig').clangd.setup {}
