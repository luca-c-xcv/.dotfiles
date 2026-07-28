-- =========================================================================
-- VIMRC MIGRATION TO NEOVIM LUA
-- This file contains your old .vimrc settings migrated to Lua
-- =========================================================================

-- GENERAL SETTINGS --------------------------------------------------------
vim.opt.termguicolors = true           -- true color support
vim.opt.syntax = "on"                  -- syntax highlighting
vim.opt.mouse = "a"                    -- enable mouse support
vim.opt.number = true                  -- line numbers
vim.opt.cursorline = true              -- highlight cursor line
vim.opt.hlsearch = true                -- highlight search results
vim.opt.showmatch = true               -- show matching brackets
vim.opt.wildmenu = true                -- command-line completion
vim.opt.showcmd = true                 -- show partial commands
vim.opt.clipboard = "unnamedplus"      -- use system clipboard

-- Allow local .vimrc (safer alternative to set exrc)
vim.opt.exrc = true
vim.opt.secure = true

-- EDITORCONFIG - Use native Neovim support (0.9+)
vim.g.editorconfig = true              -- Enable native EditorConfig support

-- CURSOR CUSTOMIZATION ----------------------------------------------------
vim.cmd([[
  highlight CursorLine guibg=#3f3f3f
  highlight Cursor guibg=#696969
]])

-- TAB SETTINGS ------------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- FILETYPE SETTINGS -------------------------------------------------------
vim.cmd([[
  filetype on
  filetype plugin on
  filetype indent on
  filetype plugin indent on
]])

-- COMPLETION SETTINGS (for modern LSP) -----------------------------------
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- GIT MERGE HELPER --------------------------------------------------------
-- Migrated from your old .vimrc Git configurations
vim.api.nvim_create_user_command('ThreeWayMergeBottom', function()
  vim.cmd('Gdiffsplit!')
  vim.cmd('wincmd J')
end, {})

-- NOTES: ------------------------------------------------------------------
-- The following plugins from your .vimrc are replaced by AstroNvim:
--   • NERDTree          → Neo-tree (use <leader>e or Ctrl-\)
--   • CoC.nvim          → Native Neovim LSP with Mason
--   • ALE               → none-ls / conform.nvim
--   • lightline         → lualine (built into AstroNvim)
--   • fzf/fzf.vim       → Telescope (use <leader>f...)
--   • vim-devicons      → nvim-web-devicons
--   • Vista.vim         → aerial.nvim (use <leader>lS for symbols)
--
-- Plugins you may still want:
--   • vim-fugitive      → Keep for advanced Git features
--   • conflict-marker   → Keep for merge conflicts
--   • vim-multiple-cursors → Use visual-multi instead (better for nvim)
