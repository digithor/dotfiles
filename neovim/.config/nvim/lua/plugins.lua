return {
  "github/copilot.vim",
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter'
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      -- vim.g.nord_disable_background = true

      require("nord").set()
    end,
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
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({})
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
      lspconfig.yamlls.setup({})
      lspconfig.ansiblels.setup({})
      lspconfig.denols.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.kotlin_language_server.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.solargraph.setup({})
      lspconfig.metals.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.tflint.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.bashls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.ruff_lsp.setup({})
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
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        go = { "gofmt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        sh = { "shfmt", "shellcheck", "shellharden" },
        yaml = { "yamlfmt" },
        rust = { "rustfmt" },
        lua = { "stylua" },
        javascript = { "prettier", "deno_fmt" },
        typescript = { "prettier", "deno_fmt" },
        json = { "jq" },
        python = { "ruff_fix", "ruff_format", "isort" },
        kotlin = { "ktlint" },
        markdown = { "prettier" },
        ruby = { "rubyfmt" },
        html = { "prettier" },
        scala = { "scalafmt" },
        java = { "google-java-format" },
      },
      notify_on_error = true,
      format_on_save = {
        lsp_fallback = true,
        timeout = 500,
      },
      format_after_save = {
        lsp_fallback = true,
      },
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
}
