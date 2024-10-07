require "nvchad.options"

-- -- use relative line numbers
vim.wo.relativenumber = true

-- Indenting 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- leave 8 lines when scrolling
vim.opt.scrolloff = 8

-- vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

-- separate clipboards for system an nvim (click leader+y for system shared clipbard)
vim.opt.clipboard = ""

-- Copilot disabled by default
vim.g.copilot_enabled = false

-- colorcolumn 88 characters
vim.opt.colorcolumn = "88"

-- guicursor as a block
vim.opt.guicursor = ""

-- local o = vim.o
-- o.cursorlineopt = "both" -- to enable cursorline!
