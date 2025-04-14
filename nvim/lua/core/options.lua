-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI settings
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- File handling
vim.opt.autowrite = true
vim.opt.autochdir = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"

-- Editing
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = 'menuone,noinsert,noselect'

-- Indent settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.wrap = true

-- Configure vim-airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'dark'