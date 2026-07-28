# 🚀 LazyGit Integration in Neovim

## ✅ What's Been Added

LazyGit is now fully integrated into your Neovim setup with a beautiful floating terminal!

## 🎯 Quick Start

### Opening LazyGit

| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>gg` | `:LazyGit` | Open LazyGit in floating window |
| `<leader>gf` | `:LazyGitCurrentFile` | LazyGit for current file history |
| `<leader>gc` | `:LazyGitConfig` | LazyGit configuration |

### In Practice:
1. Press `<space>gg` (leader is space)
2. LazyGit opens in a beautiful floating window
3. Work with git as you normally do in LazyGit
4. Press `q` to quit LazyGit and return to Neovim

## 🎨 Features

### ✨ Floating Window
- Opens in a centered floating window (90% of screen)
- No need to leave Neovim
- Smooth integration with your workflow

### 🔄 Current File History
- Press `<leader>gf` to see history of current file
- Great for tracking changes to specific files

### ⚙️ Configuration Access
- Press `<leader>gc` to edit LazyGit config
- Customize LazyGit directly from Neovim

## 🎮 LazyGit Controls (Inside LazyGit)

### Basic Navigation
- `↑/↓` or `j/k` - Navigate
- `←/→` or `h/l` - Switch panels
- `Tab` - Switch between panels
- `q` - Quit LazyGit

### File Operations
- `<space>` - Stage/unstage file
- `a` - Stage/unstage all files
- `d` - View diff
- `e` - Edit file
- `o` - Open file
- `i` - Ignore file (.gitignore)

### Commit Operations
- `c` - Commit
- `A` - Amend last commit
- `C` - Commit with editor
- `<shift>-C` - Commit using git commit (opens in editor)

### Branch Operations
- `n` - New branch
- `<space>` - Checkout branch
- `M` - Merge branch
- `r` - Rebase branch
- `d` - Delete branch
- `R` - Rename branch

### Remote Operations
- `P` - Push
- `p` - Pull
- `f` - Fetch
- `<shift>-P` - Force push

### Stash Operations
- `s` - Stash changes
- `g` - Pop stash
- `d` - Drop stash

### Other Useful Commands
- `x` - Open custom commands menu
- `?` - Show help
- `/` - Search
- `<enter>` - View commits/changes
- `<esc>` - Back/cancel

## 🔧 Git Workflow Examples

### Example 1: Quick Commit
1. Press `<space>gg` (open LazyGit)
2. Press `<space>` on files to stage
3. Press `c` to commit
4. Type commit message
5. Press `<enter>` to confirm
6. Press `P` to push
7. Press `q` to quit

### Example 2: View File History
1. Open file in Neovim
2. Press `<space>gf` (LazyGit current file)
3. View commit history for that file
4. Press `<enter>` to see changes
5. Press `q` to quit

### Example 3: Resolve Merge Conflicts
1. Press `<space>gg`
2. See conflicted files marked
3. Press `<enter>` on file to see conflicts
4. Press `e` to edit in Neovim
5. Resolve conflicts
6. Save and quit (`:wq`)
7. Back in LazyGit, press `<space>` to stage
8. Press `c` to commit merge

### Example 4: Interactive Rebase
1. Press `<space>gg`
2. Navigate to commits panel (4)
3. Press `e` on commit to start rebase
4. Use `j/k` to navigate commits
5. Press `<space>` to mark commits
6. Press `r` to rebase
7. Follow prompts

## 🎨 Customization

### LazyGit Config Location
```
~/.config/lazygit/config.yml
```

### Common Customizations

Edit your LazyGit config:
```bash
nvim ~/.config/lazygit/config.yml
```

Or press `<leader>gc` in Neovim!

Example config additions:
```yaml
gui:
  theme:
    activeBorderColor:
      - green
      - bold
    inactiveBorderColor:
      - white
  showFileTree: true
  showRandomTip: false
  
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
  
keybinding:
  universal:
    quit: 'q'
    return: '<esc>'
```

## 🔗 Integration with Other Tools

### Works Alongside:
- ✅ **vim-fugitive** - Use `:Git` commands when you prefer command-line
- ✅ **conflict-marker.vim** - Visual conflict markers in files
- ✅ **AstroNvim Git signs** - See changes in gutter
- ✅ **Telescope** - Search git files with `<leader>fg`

### When to Use What:
- **LazyGit** (`<leader>gg`) - Visual git management, staging, commits
- **vim-fugitive** (`:Git`) - Quick git commands, blame, complex operations
- **`:ThreeWayMergeBottom`** - Your custom 3-way merge view
- **Telescope** (`<leader>fg`) - Find git files quickly

## 💡 Pro Tips

1. **Stay in Flow** - No need to leave Neovim for git operations
2. **Use `<leader>gf`** - Quick file history without leaving current buffer
3. **Combine with Fugitive** - Use LazyGit for visual, Fugitive for commands
4. **Learn LazyGit keybindings** - Press `?` inside LazyGit for help
5. **Customize appearance** - Edit `~/.config/lazygit/config.yml` to your taste

## 🆘 Troubleshooting

### LazyGit doesn't open?
```vim
:checkhealth lazy
:Lazy sync
```

### Float window too small/large?
Edit `~/.config/nvim/lua/polish.lua`:
```lua
vim.g.lazygit_floating_window_scaling_factor = 0.95 -- Make it bigger (default 0.9)
```

### Want to use terminal LazyGit instead?
You can still run `lazygit` in Neovim's terminal:
```vim
:terminal lazygit
```
Or press `<leader>t` then run `lazygit`

## 🎯 Quick Reference Card

```
┌─────────────────────────────────────────────────────┐
│  LAZYGIT IN NEOVIM - QUICK REFERENCE                │
├─────────────────────────────────────────────────────┤
│  OPEN:                                              │
│    <space>gg  → Open LazyGit                        │
│    <space>gf  → File history                        │
│    <space>gc  → LazyGit config                      │
├─────────────────────────────────────────────────────┤
│  INSIDE LAZYGIT:                                    │
│    <space>    → Stage/unstage                       │
│    c          → Commit                              │
│    P          → Push                                │
│    p          → Pull                                │
│    n          → New branch                          │
│    d          → View diff / Delete                  │
│    e          → Edit file                           │
│    q          → Quit                                │
│    ?          → Help                                │
└─────────────────────────────────────────────────────┘
```

---

**Happy Git-ing! 🚀** Now you can manage your repositories without leaving Neovim!
