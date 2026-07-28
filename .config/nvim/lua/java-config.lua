-- =========================================================================
-- JAVA DEVELOPMENT CONFIGURATION FOR NEOVIM
-- Personal PC configuration for mlog-server projects
-- =========================================================================

-- This configuration supports:
-- • Multiple Java versions per project (reads from Eclipse .classpath)
-- • Eclipse-style projects with Ant builds (reads build.xml, .project)
-- • Multi-module projects
-- • Eclipse .classpath/.project integration
-- • Reads project-specific settings (.settings/org.eclipse.jdt.core.prefs)

local M = {}

-- Java development paths
M.java_workspace = vim.fn.expand("~/Develop/git/server")
M.jdtls_workspace = vim.fn.expand("~/.local/share/nvim/jdtls-workspace")

-- Detect Java version from .classpath file
M.detect_java_version = function(project_root)
  local classpath_file = project_root .. "/.classpath"
  if vim.fn.filereadable(classpath_file) == 1 then
    local content = vim.fn.readfile(classpath_file)
    for _, line in ipairs(content) do
      -- Look for JavaSE-XX pattern
      local version = line:match("JavaSE%-(%d+)")
      if version then
        return tonumber(version)
      end
    end
  end
  return 25 -- Default to Java 25
end

-- Read Eclipse project settings
M.read_eclipse_settings = function(project_root)
  local settings = {
    java_version = M.detect_java_version(project_root),
    source_paths = {},
    output_paths = {},
    encoding = "UTF-8",
    compiler_compliance = nil,
  }
  
  -- Read .classpath for source paths
  local classpath_file = project_root .. "/.classpath"
  if vim.fn.filereadable(classpath_file) == 1 then
    local content = vim.fn.readfile(classpath_file)
    for _, line in ipairs(content) do
      -- Extract source paths
      local src_path = line:match('<classpathentry kind="src" path="([^"]+)"')
      if src_path then
        table.insert(settings.source_paths, src_path)
      end
      
      -- Extract output paths
      local output = line:match('output="([^"]+)"')
      if output then
        table.insert(settings.output_paths, output)
      end
    end
  end
  
  -- Read Eclipse JDT settings (.settings/org.eclipse.jdt.core.prefs)
  local prefs_file = project_root .. "/.settings/org.eclipse.jdt.core.prefs"
  if vim.fn.filereadable(prefs_file) == 1 then
    local content = vim.fn.readfile(prefs_file)
    for _, line in ipairs(content) do
      -- Get compiler compliance level
      local compliance = line:match("org%.eclipse%.jdt%.core%.compiler%.compliance=([%d%.]+)")
      if compliance then
        settings.compiler_compliance = compliance
      end
      
      -- Get encoding
      local encoding = line:match("encoding/<project>=([^%s]+)")
      if encoding then
        settings.encoding = encoding
      end
    end
  end
  
  -- Read build.xml for Ant configuration
  local build_file = project_root .. "/build.xml"
  if vim.fn.filereadable(build_file) == 1 then
    settings.build_system = "ant"
    settings.build_file = build_file
  end
  
  return settings
end

-- Auto-detect project root (look for .project or build.xml)
M.find_project_root = function()
  local markers = {".project", "build.xml", ".git"}
  return vim.fs.dirname(vim.fs.find(markers, { upward = true })[1])
end

return M
