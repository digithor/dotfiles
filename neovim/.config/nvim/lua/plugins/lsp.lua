return {
	{
		"b0o/schemastore.nvim",
	},
	{
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
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("gopls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("ruff")
			vim.lsp.enable("jsonls")
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			vim.lsp.enable("yamlls")
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").json.schemas(),
					},
				},
			})
			vim.lsp.enable("ansiblels")
			vim.lsp.enable("denols")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("solargraph")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("tflint")
			vim.lsp.enable("bashls")
			vim.lsp.enable("eslint")
			vim.lsp.enable("harper_ls")
			vim.lsp.enable("markdown_oxide")
			vim.lsp.enable("zls")
		end,
	},
}
