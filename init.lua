-- Including the Lazy Package/Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin List
local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }, 
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x"}, 
	{"neovim/nvim-lspconfig"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/nvim-cmp"},
	{"L3MON4D3/LuaSnip"}
	
}

-- Lazy Options
local opts = {}

require("lazy").setup(plugins, opts)

-- Theme 
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

--LSP Configuration
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
-- see :help lsp-zero-keybindings
-- to learn the available actions

	lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Load clangd to be used 
require'lspconfig'.clangd.setup{}
