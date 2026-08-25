-- Customize Treesitter - Add Java support

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"xml", -- For build.xml, pom.xml
			"yaml", -- For yaml configs
			"json", -- For JSON configs
			"bash", -- For shell scripts
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}
