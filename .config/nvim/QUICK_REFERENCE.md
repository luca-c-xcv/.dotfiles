# 🎯 Neovim Quick Reference for Vim Users

## 🚀 Most Important Changes

### File Explorer
- **Old Vim:** `:NERDTree` or `:NERDTreeToggle`
- **New Neovim:** `<leader>e` or `<Ctrl-\>` (your custom binding)

### Find Files
- **Old Vim:** `:Files` (fzf)
- **New Neovim:** `<leader>ff` (Telescope)

### Find in Files (Grep)
- **Old Vim:** `:Rg` or `:Ag` (fzf)
- **New Neovim:** `<leader>fw` (Telescope live grep)

### Code Completion
- **Old Vim:** CoC.nvim with `<Tab>` and Enter
- **New Neovim:** Native LSP with `<Tab>` and `<CR>` (same behavior!)

### Go to Definition
- **Old Vim:** `gd` (CoC)
- **New Neovim:** `gd` (same!)

### Format Code
- **Old Vim:** `:ALEFix` or CoC format
- **New Neovim:** `<leader>lf` or `:Format`

### Git Commands
- **Still works:** `:Git`, `:Gwrite`, `:Gread`, `:Gdiff`
- **New custom:** `:ThreeWayMergeBottom` (your Git merge function)

## 📋 Essential Keybindings

### Leader Key
`<space>` is your leader key (same as before)

### File Operations
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>ff` | Find files |
| `<leader>fw` | Find word in files |
| `<leader>fo` | Recent files |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help |
| `<leader>fk` | Find keymaps |
| `<leader>fc` | Find commands |

### Window Navigation
| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |

### Buffer Navigation
| Key | Action |
|-----|--------|
| `]b` | Next buffer |
| `[b` | Previous buffer |
| `<leader>c` | Close buffer |
| `<leader>C` | Force close buffer |

### LSP (Code Intelligence)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<leader>la` | Code actions |
| `<leader>lf` | Format code |
| `<leader>lr` | Rename symbol |
| `<leader>lS` | Document symbols |

### Git
| Key | Action |
|-----|--------|
| `<leader>g` | Git menu |
| `<leader>gg` | LazyGit |
| `<leader>gb` | Git blame |
| `<leader>gd` | Git diff |

### Terminal
| Key | Action |
|-----|--------|
| `<leader>t` | Toggle terminal |
| `<C-'>` | Toggle terminal (alternative) |

### Custom Clipboard (Your Settings)
| Key | Action |
|-----|--------|
| `<leader>y` | Yank to clipboard |
| `<leader>d` | Delete to clipboard |
| `<leader>p` | Paste from clipboard |

### Multiple Cursors (vim-visual-multi)
| Key | Action |
|-----|--------|
| `<C-n>` | Start/add cursor |
| `<C-Down>` | Add cursor below |
| `<C-Up>` | Add cursor above |
| `n` | Find next |
| `N` | Find previous |
| `q` | Skip current |
| `Q` | Remove current |

## 🔧 Common Commands

### Plugin Management
```vim
:Lazy                 " Open plugin manager
:Lazy sync            " Update all plugins
:Lazy clean           " Remove unused plugins
:Lazy check           " Check for updates
```

### LSP Management
```vim
:Mason                " Open LSP/tool installer
:LspInfo              " Show LSP info
:LspInstall <server>  " Install LSP server
:LspRestart           " Restart LSP
```

### Health Check
```vim
:checkhealth          " Check Neovim health
:checkhealth nvim     " Check core health
:checkhealth mason    " Check Mason health
```

### Telescope (File Finder)
```vim
:Telescope find_files
:Telescope live_grep
:Telescope buffers
:Telescope help_tags
:Telescope keymaps
:Telescope commands
```

### Git (vim-fugitive - Still Works!)
```vim
:Git                  " Git status
:Git commit
:Git push
:Git pull
:Git diff
:Git blame
:Gdiffsplit           " 3-way diff
:ThreeWayMergeBottom  " Your custom merge
```

### Tree-sitter (Syntax)
```vim
:TSInstall <language> " Install syntax
:TSUpdate             " Update all
:TSModuleInfo         " Show modules
```

## 🎨 Themes

```vim
:colorscheme darcula
:colorscheme astrotheme
:colorscheme vim-jb
```

## 💡 Pro Tips

1. **Press `<leader>` and wait** - Which-key will show you all available commands
2. **Use Telescope for everything** - `<leader>f` then explore
3. **Learn one LSP binding at a time** - Start with `gd`, `gr`, and `K`
4. **`:checkhealth` is your friend** - Run it if something breaks
5. **Hover over any keymap** - `<leader>fk` shows all keymaps with descriptions

## 🆘 Emergency Commands

```vim
:Lazy restore         " Restore plugins to last working state
:LspRestart           " Restart language server
:so %                 " Reload current file
:messages             " View error messages
```

## 📦 Installing Language Servers

Open Mason and install what you need:
```vim
:Mason
```

Then search and press `i` to install:
- Python: `pylsp` or `pyright`
- JavaScript/TypeScript: `typescript-language-server`
- Go: `gopls`
- Rust: `rust-analyzer`
- C/C++: `clangd`
- Java: `jdtls`
- Shell: `bash-language-server`

## 🔄 Vim Muscle Memory Preserved

These still work exactly as before:
- `dd`, `yy`, `p` - Cut, copy, paste
- `u`, `<C-r>` - Undo, redo
- `/`, `?` - Search forward/backward
- `n`, `N` - Next/previous search
- `:%s/old/new/g` - Replace all
- `.` - Repeat last command
- `*`, `#` - Search word under cursor
- `ciw`, `diw`, `viw` - Change/delete/select word
- All your favorite motions!

---

**Remember:** When in doubt, press `<leader>` and wait for Which-key to show you options! 🎯
