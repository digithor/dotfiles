local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.termguicolors = true
opt.autoindent = true
opt.linebreak = true
opt.mouse = "v"
opt.splitbelow = true
opt.splitright = true
opt.smartcase = true
opt.scrolloff = 3
opt.cursorline = true

vim.cmd.colorscheme("catppuccin-frappe")
vim.lsp.set_log_level("off") -- LSP logging
