-- =========================================================================
-- 1. SET LEADER KEYS FIRST (CRITICAL FOR LAZY.NVIM)
-- =========================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================================================================
-- 2. BOOTSTRAP AND SETUP LAZY.NVIM
-- =========================================================================
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" },
      { "Press any key to exit...", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- Initialize Lazy and load setup files
require("lazy_setup")
require("polish")
require("options")

-- =========================================================================
-- 3. VIMRC MIGRATION & CUSTOM KEYMAPS
-- =========================================================================
-- Load migrated vimrc settings (pure Lua, no conflicts)
require("vimrc-migration")

-- Load custom cheatsheet
require("cheatsheet")

-- Optional: If you really need old .vimrc for some reason, uncomment below
-- WARNING: This may cause plugin conflicts with AstroNvim
-- local vimrc_path = vim.fn.expand("~/.vimrc")
-- if vim.fn.filereadable(vimrc_path) == 1 then
--   vim.cmd("source " .. vimrc_path)
-- end

local map = vim.keymap.set

-- Custom Lua Keymaps
map("n", "<C-\\>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Ctrl+Arrow word navigation (map Terminator's escape sequences)
-- Terminator sends <80><fd>V for Ctrl+Right and <80><fd>U for Ctrl+Left
map("n", "\x80\xfdV", "w", { noremap = true, desc = "Move to next word" })
map("n", "\x80\xfdU", "b", { noremap = true, desc = "Move to previous word" })
map("i", "\x80\xfdV", "<C-o>w", { noremap = true, desc = "Move to next word in insert mode" })
map("i", "\x80\xfdU", "<C-o>b", { noremap = true, desc = "Move to previous word in insert mode" })

-- Enable scrollbind for merge conflicts (synched scrolling in splits)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit,gitrebase,gitconfig,gitsendemail,git",
  callback = function()
    vim.opt.scrollbind = true
  end,
})
