return {
	{
		"supermaven-inc/supermaven-nvim",
		opts = {},
	},
	{
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
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			require("mini.indentscope").setup()
			require("mini.surround").setup()
			require("mini.comment").setup()
			require("mini.ai").setup()
			require("mini.completion").setup()
			require("mini.map").setup()
			require("mini.move").setup()

			require("mini.map").toggle()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			return require("indent-rainbowline").make_opts(opts)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		after = "catppuccin",
		config = function()
			require("bufferline").setup({
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin-frappe",
				},
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()

			require("gitsigns").toggle_current_line_blame()
		end,
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
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.gopls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.ruff.setup({})
			lspconfig.ruff_lsp.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.ansiblels.setup({})
			lspconfig.denols.setup({})
			lspconfig.kotlin_language_server.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.solargraph.setup({})
			lspconfig.metals.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.tflint.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.bashls.setup({})
			lspconfig.eslint.setup({})
		end,
	},
	{
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
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				go = { "gofmt", "golines" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				sh = { "shfmt", "shellcheck", "shellharden" },
				yaml = { "yamlfmt" },
				rust = { "rustfmt" },
				lua = { "stylua" },
				javascript = { "prettier", "deno_fmt" },
				typescript = { "prettier", "deno_fmt" },
				json = { "jq" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports", "isort" },
				kotlin = { "ktlint" },
				markdown = { "prettier" },
				ruby = { "rubyfmt" },
				html = { "prettier" },
				scala = { "scalafmt" },
				java = { "google-java-format" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			notify_on_error = true,
			notify_no_formatters = true,
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		config = true,
	},
}
