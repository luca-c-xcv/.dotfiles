-- Customize Mason - Auto-install Java development tools
if true then
	return {}
end

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
				-- "jdtls",                  -- Java Language Server (DISABLED)

				-- install formatters
				"stylua",
				-- "google-java-format",     -- Java formatter (DISABLED)

				-- install debuggers
				"debugpy",
				-- "java-debug-adapter",     -- Java debugger (DISABLED)
				-- "java-test",              -- Java test runner (DISABLED)

				-- install linters
				-- "checkstyle",             -- Java linter (DISABLED)

				-- install any other package
				"tree-sitter-cli",
			},
		},
	},
}
