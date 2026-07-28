-- Java LSP configuration using nvim-jdtls
-- Reads Eclipse project settings (.classpath, .project, .settings/)
-- Auto-detects Java version, source paths, and build configuration

-- DISABLED - Remove the line below to re-enable Java support
if true then return {} end

---@type LazySpec
return {
  "mfussenegger/nvim-jdtls",
  ft = {"java"},
  dependencies = {
    "mfussenegger/nvim-dap", -- Debug Adapter Protocol for debugging
  },
  config = function()
    local jdtls = require("jdtls")
    local java_config = require("java-config")
    
    -- Function to setup jdtls when opening Java files
    local function setup_jdtls()
      local project_root = java_config.find_project_root() or vim.fn.getcwd()
      local project_name = vim.fn.fnamemodify(project_root, ":p:h:t")
      local workspace_dir = java_config.jdtls_workspace .. "/" .. project_name
      
      -- Create workspace directory
      vim.fn.mkdir(workspace_dir, "p")
      
      -- Read Eclipse project settings
      local project_settings = java_config.read_eclipse_settings(project_root)
      
      -- jdtls installation path (Mason will install this)
      local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local jdtls_bin = jdtls_path .. "/bin/jdtls"
      
      -- Check if jdtls is installed
      if vim.fn.executable(jdtls_bin) == 0 then
        vim.notify("jdtls not found. Please run :Mason and install 'jdtls'", vim.log.levels.WARN)
        return
      end
      
      local config = {
        cmd = {
          jdtls_bin,
          "-data", workspace_dir,
        },
        root_dir = project_root,
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = {
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.Assert.*",
                "org.mockito.Mockito.*",
              },
              filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              useBlocks = true,
            },
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            configuration = {
              updateBuildConfiguration = "automatic",
              -- Use project-specific Java version
              runtimes = {
                {
                  name = "JavaSE-" .. project_settings.java_version,
                  path = vim.fn.getenv("JAVA_HOME") or "/usr/lib/jvm/default-java/",
                  default = true,
                },
              },
            },
            format = {
              enabled = true,
              -- Eclipse formatter settings (if available in project)
              settings = {
                url = project_root .. "/.settings/org.eclipse.jdt.core.prefs",
                profile = "Eclipse",
              },
            },
          },
        },
        init_options = {
          bundles = {},
          extendedClientCapabilities = {
            progressReportProvider = true,
            classFileContentsSupport = true,
            generateToStringPromptSupport = true,
            hashCodeEqualsPromptSupport = true,
            advancedExtractRefactoringSupport = true,
            advancedOrganizeImportsSupport = true,
            generateConstructorPromptSupport = true,
            generateDelegateMethodsPromptSupport = true,
            moveRefactoringSupport = true,
            overrideMethodsPromptSupport = true,
            inferSelectionSupport = { "extractMethod", "extractVariable", "extractField" },
          },
        },
        on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
          
          -- Set encoding from project settings
          vim.api.nvim_buf_set_option(bufnr, "fileencoding", project_settings.encoding)
          
          -- Load Java keybindings from dedicated file
          local java_keymaps = require("java-keymaps")
          java_keymaps.setup(bufnr)
          
          vim.notify(
            "Java LSP attached\n" ..
            "Project: " .. project_name .. "\n" ..
            "Java: " .. project_settings.java_version .. "\n" ..
            "Build: " .. (project_settings.build_system or "unknown") .. "\n" ..
            "Encoding: " .. project_settings.encoding,
            vim.log.levels.INFO
          )
        end,
      }
      
      -- Start jdtls
      jdtls.start_or_attach(config)
    end
    
    -- Auto-setup when opening Java files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = setup_jdtls,
    })
  end,
}
