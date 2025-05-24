return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			go = { "gofmt", "golines" },
			terraform = { "terraform_fmt" },
			tf = { "terraform_fmt" },
			sh = { "shfmt", "shellcheck", "shellharden" },
			yaml = { "yamlfmt" },
			rust = { "rustfmt" },
			toml = { "taplo" },
			lua = { "stylua" },
			javascript = { "prettier", "deno_fmt" },
			typescript = { "prettier", "deno_fmt" },
			json = { "jq" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports", "isort" },
			markdown = { "prettier" },
			ruby = { "rubyfmt" },
			html = { "prettier" },
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
}
