return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		flavour = "frappe",
		-- default_integrations = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			indent_blankline = {
				enabled = true,
			},
			mini = {
				enabled = true,
			},
			lsp_trouble = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underline = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			illuminate = {
				enabled = true,
				lsp = true,
			},
		},
	},
}
