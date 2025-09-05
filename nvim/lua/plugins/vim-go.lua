return {
  "fatih/vim-go",
  build = ":GoInstallBinaries",
  config = function()
    -- İsteğe bağlı ayarlar
    vim.g.go_fmt_autosave = 0      -- save sırasında format kapalı
    vim.g.go_list_type = "quickfix" -- quickfix listesi kullan
  end,
}

