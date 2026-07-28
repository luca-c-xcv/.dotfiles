-- Customize Mason - Auto-install Java development tools

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "jdtls",                  -- Java Language Server
        
        -- install formatters
        "stylua",
        "google-java-format",     -- Java formatter

        -- install debuggers
        "debugpy",
        "java-debug-adapter",     -- Java debugger
        "java-test",              -- Java test runner

        -- install linters
        "checkstyle",             -- Java linter

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
