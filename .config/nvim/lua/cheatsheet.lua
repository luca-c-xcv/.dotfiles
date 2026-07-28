-- =========================================================================
-- CUSTOM CHEATSHEET AND SHORTCUTS POPUP
-- =========================================================================

local M = {}

-- Function to show a custom cheatsheet popup
M.show_cheatsheet = function()
  local lines = {
    "╔═══════════════════════════════════════════════════════════════════╗",
    "║                     NEOVIM SHORTCUTS CHEATSHEET                   ║",
    "╠═══════════════════════════════════════════════════════════════════╣",
    "║                                                                   ║",
    "║  🔍 FILE OPERATIONS                                               ║",
    "║    <space>e        Toggle file explorer (Neo-tree)                ║",
    "║    <space>ff       Find files                                     ║",
    "║    <space>fF       Find ALL files (including hidden)              ║",
    "║    <space>fw       Find words (live grep) ★ NEW!                  ║",
    "║    <space>fW       Find word under cursor ★ NEW!                  ║",
    "║    <space>fc       Find word under cursor (in files)              ║",
    "║    <space>fl       Find lines (grep in open buffers)              ║",
    "║    <space>fo       Recent files                                   ║",
    "║    <space>fb       Find buffers                                   ║",
    "║    <space>fh       Find help                                      ║",
    "║    <space>fk       Find keymaps                                   ║",
    "║    <Ctrl-\\>        Toggle Neo-tree                                ║",
    "║                                                                   ║",
    "║  🚀 GIT INTEGRATION                                               ║",
    "║    <space>gg       Open LazyGit                                   ║",
    "║    <space>gf       LazyGit current file                           ║",
    "║    <space>gc       LazyGit config                                 ║",
    "║    <space>gb       Git blame                                      ║",
    "║    <space>gd       Git diff                                       ║",
    "║                                                                   ║",
    "║  📝 LSP (CODE INTELLIGENCE)                                       ║",
    "║    gd             Go to definition                                ║",
    "║    gr             Find references                                 ║",
    "║    K              Hover documentation                             ║",
    "║    <space>la      Code actions                                    ║",
    "║    <space>lf      Format code                                     ║",
    "║    <space>lr      Rename symbol                                   ║",
    "║    <space>lS      Document symbols                                ║",
    "║                                                                   ║",
    "║  🪟 WINDOW NAVIGATION                                             ║",
    "║    <Ctrl-h>       Move to left window                             ║",
    "║    <Ctrl-j>       Move to bottom window                           ║",
    "║    <Ctrl-k>       Move to top window                              ║",
    "║    <Ctrl-l>       Move to right window                            ║",
    "║    \\              Horizontal split                                ║",
    "║    |              Vertical split                                  ║",
    "║                                                                   ║",
    "║  📋 BUFFER MANAGEMENT                                             ║",
    "║    ]b             Next buffer                                     ║",
    "║    [b             Previous buffer                                 ║",
    "║    <space>c       Close buffer                                    ║",
    "║    <space>C       Force close buffer                              ║",
    "║                                                                   ║",
    "║  📋 CLIPBOARD                                                     ║",
    "║    <space>y       Yank to system clipboard                        ║",
    "║    <space>d       Delete to system clipboard                      ║",
    "║    <space>p       Paste from system clipboard                     ║",
    "║                                                                   ║",
    "║  🎯 MULTIPLE CURSORS (vim-visual-multi)                           ║",
    "║    <Ctrl-n>       Add cursor / Select next match                  ║",
    "║    <Ctrl-Down>    Add cursor below                                ║",
    "║    <Ctrl-Up>      Add cursor above                                ║",
    "║    n              Find next                                       ║",
    "║    q              Skip current                                    ║",
    "║                                                                   ║",
    "║  💻 TERMINAL                                                      ║",
    "║    <space>t       Toggle terminal                                 ║",
    "║                                                                   ║",
    "║  🔧 PLUGIN MANAGEMENT                                             ║",
    "║    :Lazy          Open Lazy plugin manager                        ║",
    "║    :Mason         Open Mason (LSP/tool installer)                 ║",
    "║    :checkhealth   Check Neovim health                             ║",
    "║                                                                   ║",
    "║  ℹ️  HELP                                                          ║",
    "║    <space>        Press and wait → Which-Key popup!               ║",
    "║    :Cheatsheet    This cheatsheet                                 ║",
    "║    ?              Help (in Neo-tree or other plugins)             ║",
    "║                                                                   ║",
    "╚═══════════════════════════════════════════════════════════════════╝",
    "",
    "Press 'q' or <Esc> to close this window",
  }

  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  
  -- Get editor dimensions
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  
  -- Calculate popup size and position
  local win_width = math.min(75, width - 4)
  local win_height = math.min(#lines + 2, height - 4)
  local row = math.floor((height - win_height) / 2)
  local col = math.floor((width - win_width) / 2)
  
  -- Create floating window
  local opts = {
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }
  
  local win = vim.api.nvim_open_win(buf, true, opts)
  
  -- Set window options
  vim.api.nvim_win_set_option(win, 'winblend', 0)
  
  -- Close on 'q' or '<Esc>'
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':close<CR>', { noremap = true, silent = true })
end

-- Create user command
vim.api.nvim_create_user_command('Cheatsheet', M.show_cheatsheet, {})

-- Optional: Add a keybinding to open cheatsheet
vim.keymap.set('n', '<leader>?', M.show_cheatsheet, { desc = 'Show Cheatsheet' })

return M
