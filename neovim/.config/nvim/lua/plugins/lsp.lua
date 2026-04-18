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
		opts = {
			servers = {
				lua_ls = {},
				terraformls = {},
				rust_analyzer = {},
				gopls = {},
				ruff = {},
				ty = {},
				jsonls = {
					-- lazy-load schemastore when needed
					before_init = function(_, new_config)
						new_config.settings.json.schemas = new_config.settings.json.schemas or {}
						vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
					end,
					settings = {
						json = {
							format = {
								enable = true,
							},
							validate = { enable = true },
						},
					},
				},
				yamlls = {
					-- lazy-load schemastore when needed
					before_init = function(_, new_config)
						new_config.settings.yaml.schemas = vim.tbl_deep_extend(
							"force",
							new_config.settings.yaml.schemas or {},
							require("schemastore").yaml.schemas()
						)
					end,
					settings = {
						redhat = { telemetry = { enabled = false } },
						yaml = {
							keyOrdering = false,
							format = {
								enable = true,
							},
							validate = true,
							schemaStore = {
								enable = false,
								url = "",
							},
						},
					},
				},
				ansiblels = {},
				denols = {},
				tailwindcss = {},
				solargraph = {},
				ts_ls = {},
				tflint = {},
				bashls = {},
				eslint = {},
				harper_ls = {},
				markdown_oxide = {},
				zls = {},
				biome = {},
			},
		},
	},
}
