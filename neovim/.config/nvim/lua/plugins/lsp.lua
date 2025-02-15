return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neoconf.nvim",
			cmd = "Neoconf",
			config = true,
		},
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.terraformls.setup({})
		lspconfig.rust_analyzer.setup({})
		lspconfig.gopls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.ruff.setup({})
		lspconfig.yamlls.setup({})
		lspconfig.ansiblels.setup({})
		lspconfig.denols.setup({})
		lspconfig.kotlin_language_server.setup({})
		lspconfig.jdtls.setup({})
		lspconfig.solargraph.setup({})
		lspconfig.ts_ls.setup({})
		lspconfig.tflint.setup({})
		lspconfig.tailwindcss.setup({})
		lspconfig.bashls.setup({})
		lspconfig.eslint.setup({})
	end,
}
