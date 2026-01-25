vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'                   -- allow the mouse to be used
vim.opt.scrolloff = 12                -- display no less than 10 lines when scrolling

-- Tab
vim.opt.tabstop = 2                   -- number of visual spaces per Tab
vim.opt.softtabstop = 2               -- number of spaces in tab when editing
vim.opt.shiftwidth = 2                -- insert 2 spaces on a tab
vim.opt.expandtab = true              -- tabs are spaces

-- UI configs
vim.opt.number = true                 -- show absolute line number
vim.opt.relativenumber = true         -- show relative line numbers
vim.opt.cursorline = true             -- highlight cursor line
vim.opt.splitbelow = true             -- open new vertical splits on bottom
vim.opt.splitright = true             -- open new horizontal splits on right
vim.opt.termguicolors = true         -- enable 24-bit RGB color in the TUI
-- vim.opt.showmode = false             -- display mode hint

-- Searching
vim.opt.incsearch = true              -- search as characters are entered
vim.opt.hlsearch = false              -- do not highlight matches
vim.opt.ignorecase = true             -- ignore case in searches by default
vim.opt.smartcase = true              -- but make it case sensitive if uppercase is entered
