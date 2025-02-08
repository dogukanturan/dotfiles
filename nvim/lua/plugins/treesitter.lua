return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "go", "python", "yaml", "cpp" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
}
