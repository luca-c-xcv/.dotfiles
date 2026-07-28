-- =========================================================================
-- JAVA KEYBINDINGS - DEDICATED CONFIGURATION
-- Personal PC - Java development shortcuts
-- =========================================================================

local M = {}

-- Setup Java-specific keybindings
M.setup = function(bufnr)
  local jdtls = require("jdtls")
  
  -- =========================================================================
  -- STANDARD LSP KEYBINDINGS
  -- =========================================================================
  
  -- Navigation (no prefix - standard Vim/LSP)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = bufnr })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", buffer = bufnr })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references", buffer = bufnr })
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition", buffer = bufnr })
  
  -- =========================================================================
  -- LSP ACTIONS (<space>l menu)
  -- =========================================================================
  
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
  vim.keymap.set("n", "<leader>lf", function() 
    vim.lsp.buf.format({ async = true }) 
  end, { desc = "Format buffer", buffer = bufnr })
  
  -- =========================================================================
  -- JAVA-SPECIFIC KEYBINDINGS (<space>j menu)
  -- =========================================================================
  
  -- Organize imports
  vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, { 
    desc = "Organize imports", 
    buffer = bufnr 
  })
  
  -- Extract variable
  vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, { 
    desc = "Extract variable", 
    buffer = bufnr 
  })
  vim.keymap.set("v", "<leader>jv", [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]], { 
    desc = "Extract variable (visual)", 
    buffer = bufnr 
  })
  
  -- Extract constant
  vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, { 
    desc = "Extract constant", 
    buffer = bufnr 
  })
  vim.keymap.set("v", "<leader>jc", [[<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>]], { 
    desc = "Extract constant (visual)", 
    buffer = bufnr 
  })
  
  -- Extract method
  vim.keymap.set("v", "<leader>jm", [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]], { 
    desc = "Extract method", 
    buffer = bufnr 
  })
  
  -- Testing
  vim.keymap.set("n", "<leader>jt", jdtls.test_class, { 
    desc = "Test class", 
    buffer = bufnr 
  })
  vim.keymap.set("n", "<leader>jn", jdtls.test_nearest_method, { 
    desc = "Test nearest method", 
    buffer = bufnr 
  })
  
  -- =========================================================================
  -- BUILD INTEGRATION
  -- =========================================================================
  
  -- Build with Ant (if build.xml exists)
  local java_config = require("java-config")
  local project_root = java_config.find_project_root() or vim.fn.getcwd()
  local project_settings = java_config.read_eclipse_settings(project_root)
  
  if project_settings.build_system == "ant" then
    vim.keymap.set("n", "<leader>jb", function()
      vim.cmd("! cd " .. project_root .. " && ant ci-compile")
    end, { desc = "Build with Ant", buffer = bufnr })
  end
end

return M
