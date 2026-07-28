# 🚀 Vim to Neovim Migration Guide

## What I Changed

### 1. **Created `vimrc-migration.lua`**
   - Migrated all your .vimrc settings to pure Lua
   - No more Vundle or plugin conflicts
   - All settings now in `/home/luca/.config/nvim/lua/vimrc-migration.lua`

### 2. **Updated `init.lua`**
   - Now loads `vimrc-migration.lua` instead of `.vimrc`
   - Removed Vundle-based plugin loading
   - Kept your custom keymaps

### 3. **Updated `plugins/user.lua`**
   - Migrated plugins you actually need from .vimrc:
     - ✅ vim-fugitive (Git commands)
     - ✅ conflict-marker.vim (merge conflicts)
     - ✅ editorconfig-vim (project settings)
     - ✅ darcula theme
   - Added modern alternatives:
     - vim-multiple-cursors → **vim-visual-multi** (better)
     - fzf → **telescope-fzf-native** (faster sorting)

## 🎯 Plugin Replacements (What AstroNvim Already Has)

| Old Vim Plugin | New Neovim Equivalent | How to Use |
|----------------|----------------------|------------|
| NERDTree | Neo-tree | `<leader>e` or `Ctrl-\` |
| CoC.nvim | Native LSP + Mason | `<leader>l` menu |
| ALE | none-ls/conform | Auto-formatting built-in |
| lightline | lualine | Already styled |
| fzf.vim | Telescope | `<leader>f` menu |
| vim-devicons | nvim-web-devicons | Better integration |
| Vista.vim | aerial.nvim | `<leader>lS` for symbols |

## 🔑 Essential Keybindings (Your Custom + AstroNvim)

### File Navigation
- `<leader>e` - Toggle file explorer (Neo-tree)
- `<Ctrl-\>` - Your custom Neo-tree toggle
- `<leader>ff` - Find files (Telescope)
- `<leader>fw` - Find word (Telescope grep)
- `<leader>fo` - Recent files

### Git Integration
- `<leader>g` - Git menu
- `<leader>gg` - LazyGit
- `:Git` or `:G` - vim-fugitive commands
- `:ThreeWayMergeBottom` - Your custom merge command

### LSP (Replaces CoC)
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation
- `<leader>la` - Code actions
- `<leader>lf` - Format code
- `<leader>lr` - Rename symbol

### Clipboard (Your Settings)
- `<leader>y` - Yank to system clipboard
- `<leader>d` - Delete to system clipboard
- `<leader>p` - Paste from system clipboard

### Multiple Cursors (vim-visual-multi)
- `<C-n>` - Add cursor at word
- `<C-Up/Down>` - Add cursor above/below
- `n/N` - Select next/previous occurrence
- `q` - Skip current occurrence
- `Q` - Remove current cursor

## 📦 Installing Language Servers (Replaces CoC extensions)

AstroNvim uses Mason for LSP management:

```vim
:Mason
```

Then install what you need:
- `pylsp` - Python
- `clangd` - C/C++
- `jdtls` - Java
- `bash-language-server` - Shell scripts
- `typescript-language-server` - JavaScript/TypeScript

## 🎨 Themes

Your darcula theme is installed. To switch themes:
```vim
:colorscheme darcula
:colorscheme astrotheme
:colorscheme vim-jb
```

## 🔧 Configuration Files Structure

```
~/.config/nvim/
├── init.lua                  # Main entry point
├── lua/
│   ├── vimrc-migration.lua   # Your migrated .vimrc settings
│   ├── options.lua           # General options
│   ├── polish.lua            # Final touches
│   └── plugins/
│       ├── user.lua          # Your custom plugins
│       ├── astrocore.lua     # Core settings
│       ├── astrolsp.lua      # LSP configuration
│       └── treesitter.lua    # Syntax highlighting
```

## ⚙️ Next Steps

1. **Test the configuration:**
   ```bash
   nvim
   ```

2. **Install plugins:**
   - Plugins will auto-install on first launch
   - Or run `:Lazy sync`

3. **Install language servers:**
   ```vim
   :Mason
   ```

4. **Check health:**
   ```vim
   :checkhealth
   ```

5. **If you have issues:**
   - Backup your old .vimrc: `cp ~/.vimrc ~/.vimrc.backup`
   - The migration file has all your settings

## 🆘 Troubleshooting

### If something doesn't work:
1. Check `:Lazy` for plugin status
2. Run `:checkhealth` for diagnostics
3. Check `:Mason` for LSP servers
4. View logs: `:messages`

### To temporarily use old .vimrc:
Uncomment lines in `init.lua`:
```lua
local vimrc_path = vim.fn.expand("~/.vimrc")
if vim.fn.filereadable(vimrc_path) == 1 then
  vim.cmd("source " .. vimrc_path)
end
```

## 📚 Learning Resources

- AstroNvim docs: https://docs.astronvim.com
- Neovim docs: `:help nvim`
- Your keybindings: `<leader>fk` (find keymaps)
- Command palette: `<leader>fC`

## 💡 Pro Tips

1. **Use Telescope for everything:** `<leader>f` menu is your friend
2. **Learn LSP features:** `<leader>l` menu replaces CoC
3. **Git integration:** `<leader>g` menu is powerful
4. **Which-key:** Press `<leader>` and wait - it shows all options!
5. **Help:** `<leader>h` for help menu

---
**Note:** Your old .vimrc is still at `~/.vimrc` but is no longer loaded to avoid conflicts.
All settings are migrated to `vimrc-migration.lua`.
