-- User plugins configuration
-- Migrated from Vim + additional modern Neovim plugins

---@type LazySpec
return {

  -- GIT INTEGRATION (keeping vim-fugitive from your .vimrc)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread" },
  },
  
  -- LAZYGIT INTEGRATION - Beautiful floating terminal
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
      { "<leader>gc", "<cmd>LazyGitConfig<cr>", desc = "LazyGit Config" },
    },
  },
  
  -- GIT CONFLICT MARKERS (from your .vimrc)
  {
    "rhysd/conflict-marker.vim",
    event = "BufReadPost",
  },

  -- BETTER MULTIPLE CURSORS (replaces vim-multiple-cursors)
  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    keys = {
      { "<C-n>", mode = { "n", "v" }, desc = "Add cursor" },
    },
  },

  -- EDITORCONFIG SUPPORT - DISABLED (Neovim has native support)
  -- If you have issues, this plugin is disabled. Use native EditorConfig instead.
  {
    "editorconfig/editorconfig-vim",
    enabled = false,  -- Disabled - use Neovim's native EditorConfig
  },

  -- COLORSCHEME (migrated from darcula in .vimrc)
  {
    "doums/darcula",
    lazy = false,
    priority = 1000,
  },

  -- ALTERNATIVE: JetBrains theme (from your .vimrc)
  {
    "devsjc/vim-jb",
    lazy = true,
  },

  -- ICONS (already better integrated in AstroNvim)
  -- Note: nvim-web-devicons is already included, better than vim-devicons

  -- TELESCOPE ENHANCEMENTS (replaces fzf from .vimrc, but better)
  -- Telescope is already in AstroNvim, this just adds fzf native sorter
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  -- CUSTOMIZE DASHBOARD
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "╔═══════════════════════════════════════╗",
            "║                                       ║",
            "║   Welcome to Neovim, Luca! 🚀         ║",
            "║                                       ║",
            "║   Migrated from Vim with ❤️            ║",
            "║                                       ║",
            "╚═══════════════════════════════════════╝",
          }, "\n"),
        },
      },
    },
  },
}
