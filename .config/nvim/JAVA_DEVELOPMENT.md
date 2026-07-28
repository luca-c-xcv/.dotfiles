# ☕ Java Development in Neovim - Configuration Guide

## 🎯 What Was Configured

Your Neovim is now set up for Java development with **Eclipse project integration**!

### ✅ Features

1. **Eclipse Project Support**
   - Reads `.classpath` for Java version and source paths
   - Reads `.project` for project metadata
   - Reads `.settings/org.eclipse.jdt.core.prefs` for compiler settings
   - Auto-detects encoding and formatter settings

2. **Multi-Version Java Support**
   - Automatically detects Java version from Eclipse `.classpath`
   - Your LogObject project uses **Java 25**
   - Each project can use different Java versions

3. **Ant Build Integration**
   - Detects `build.xml` files
   - Keybinding to run Ant builds: `<space>jb`

4. **LSP Features (jdtls)**
   - Code completion
   - Go to definition
   - Find references
   - Hover documentation
   - Organize imports
   - Extract method/variable/constant
   - Code actions
   - Formatting (using Eclipse settings)

## 📦 Files Created

```
~/.config/nvim/lua/
├── java-config.lua              # Eclipse project reader
└── plugins/
    ├── java-lsp.lua              # jdtls configuration
    ├── mason.lua                 # Auto-install Java tools
    └── treesitter.lua            # Java syntax highlighting
```

## 🚀 Getting Started

### 1. Install Java Tools

Open Neovim and let Mason install the Java tools automatically:

```bash
nvim
```

The tools will install in the background. Check progress with:
```vim
:Mason
```

You should see:
- ✓ jdtls (Java Language Server)
- ✓ google-java-format (Java formatter)
- ✓ checkstyle (Java linter)
- ✓ java-debug-adapter (Debugger)
- ✓ java-test (Test runner)

### 2. Open a Java File

```bash
cd ~/Develop/git/server/mlog-server/LogObject
nvim src/java/ch/
```

When you open a `.java` file, you'll see a notification showing:
- Project name
- Java version (detected from `.classpath`)
- Build system (Ant detected from `build.xml`)
- Encoding (from Eclipse settings)

### 3. Wait for LSP to Start

The first time you open a project, jdtls needs to:
1. Index the project
2. Download dependencies
3. Build the workspace

You'll see progress in the bottom right. This takes 1-2 minutes for the first time.

## ⌨️  Java Keybindings

### Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show documentation |
| `<space>D` | Go to type definition |

### Editing
| Key | Action |
|-----|--------|
| `<space>rn` | Rename symbol |
| `<space>ca` | Code actions |
| `<space>f` | Format code (uses Eclipse formatter) |

### Java-Specific
| Key | Action |
|-----|--------|
| `<space>jo` | Organize imports |
| `<space>jv` | Extract variable (normal/visual) |
| `<space>jc` | Extract constant (normal/visual) |
| `<space>jm` | Extract method (visual) |
| `<space>jt` | Run test class |
| `<space>jn` | Run nearest test method |
| `<space>jb` | Build with Ant |

### Workspace
| Key | Action |
|-----|--------|
| `<space>wa` | Add workspace folder |
| `<space>wr` | Remove workspace folder |

## 🔧 How It Works

### Eclipse Integration

When you open a Java file, the config:

1. **Finds project root** by looking for:
   - `.project` (Eclipse project file)
   - `build.xml` (Ant build file)
   - `.git` (Git repository)

2. **Reads `.classpath`** to extract:
   - Java version (e.g., `JavaSE-25`)
   - Source paths (e.g., `src/java`, `src/java-tests`)
   - Output paths (e.g., `target/classes`)

3. **Reads `.settings/org.eclipse.jdt.core.prefs`** for:
   - Compiler compliance level
   - File encoding
   - Formatter settings

4. **Configures jdtls** with:
   - Correct Java version for the project
   - Source paths from `.classpath`
   - Encoding from Eclipse settings
   - Formatter settings (if available)

### Multi-Project Support

Each project gets its own jdtls workspace:
```
~/.local/share/nvim/jdtls-workspace/
├── mlog-server/           (main project)
├── LogObject/             (sub-module)
└── MyAbi/                 (another sub-module)
```

## 🛠️  Troubleshooting

### jdtls Not Starting?

Check if it's installed:
```vim
:Mason
```

Look for `jdtls` in the list. If missing, install it:
```vim
:MasonInstall jdtls
```

### Java Version Mismatch?

The config reads from `.classpath`. Check your file:
```bash
grep "JavaSE" ~/Develop/git/server/mlog-server/LogObject/.classpath
```

Should show: `JavaSE-25`

### LSP Not Working?

Check LSP status:
```vim
:LspInfo
```

Restart LSP:
```vim
:LspRestart
```

### Build Errors?

Make sure you can build with Ant manually:
```bash
cd ~/Develop/git/server/mlog-server/LogObject
ant ci-compile
```

## 💡 Pro Tips

1. **Use Code Actions** (`<space>ca`)
   - Auto-import missing classes
   - Generate getters/setters
   - Implement missing methods
   - Fix common issues

2. **Organize Imports** (`<space>jo`)
   - Automatically adds/removes imports
   - Groups imports correctly

3. **Extract Refactorings**
   - Select code in visual mode
   - Press `<space>jv` for variable
   - Press `<space>jm` for method

4. **Format on Save**
   - Press `<space>f` to format current file
   - Uses Eclipse formatter settings

5. **Test Integration**
   - `<space>jt` runs entire test class
   - `<space>jn` runs test under cursor

## 📚 Additional Resources

- jdtls documentation: https://github.com/eclipse/eclipse.jdt.ls
- nvim-jdtls plugin: https://github.com/mfussenegger/nvim-jdtls
- Java LSP features: `:help lsp`

## 🎓 Learning Path

1. **Start Simple**: Open a Java file, try `gd` and `K`
2. **Code Actions**: Use `<space>ca` to see what's available
3. **Refactoring**: Select code and try extract methods
4. **Testing**: Run tests with `<space>jn`
5. **Building**: Try `<space>jb` to build with Ant

---

**Happy Java coding in Neovim!** ☕ 🚀
