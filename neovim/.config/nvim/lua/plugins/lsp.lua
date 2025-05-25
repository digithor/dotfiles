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
		opts = function()
			local ret = {
				servers = {
					lua_ls = {},
					terraformls = {},
					rust_analyzer = {},
					gopls = {},
					pyright = {},
					ruff = {},
					jsonls = {
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
					},
					yamlls = {
						settings = {
							yaml = {
								schemaStore = {
									enable = false,
									url = "",
								},
								schemas = require("schemastore").json.schemas(),
							},
						},
					},
					ansiblels = {},
					denols = {},
					solargraph = {},
					ts_ls = {},
					tflint = {},
					bashls = {},
					eslint = {},
					harper_ls = {},
					zls = {},
				},
			}
			return ret
		end,
	},
}
