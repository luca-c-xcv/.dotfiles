-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- =========================================================================
-- LAZYGIT CONFIGURATION
-- =========================================================================

-- Set LazyGit floating window size
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window

-- LazyGit keybindings are set in plugins/user.lua:
-- <leader>gg - Open LazyGit
-- <leader>gf - LazyGit for current file
-- <leader>gc - LazyGit config

-- =========================================================================
-- ADDITIONAL CUSTOM SETTINGS
-- =========================================================================

-- Auto-change directory to current file's directory (optional)
-- vim.opt.autochdir = true

-- Preserve undo history across sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Better search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true -- override ignorecase if search has uppercase
