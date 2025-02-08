return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        -- Add your telescope configuration here
      })

      -- Keymaps
      local keymap = vim.keymap
      keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
      keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
      keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
    end,
  }
}
