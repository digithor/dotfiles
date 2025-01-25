return {
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
    end,
}
