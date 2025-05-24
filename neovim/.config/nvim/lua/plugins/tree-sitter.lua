return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		ensure_installed = "all",
		auto_install = true,
		sync_install = true,
		autotag = { enable = true },
	},
}
