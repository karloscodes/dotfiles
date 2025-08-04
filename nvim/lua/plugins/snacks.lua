return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- Configure the file picker command to include hidden files
      sources = {
        files = {
          cmd = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--color", "never" },
        },
      },
    },
  },
  keys = {
    -- Override the default find files keybinding to include hidden files
    {
      "<leader><space>",
      function()
        require("snacks").picker.files({ 
          cmd = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--color", "never" }
        })
      end,
      desc = "Find Files (including hidden)",
    },
    {
      "<leader>ff",
      function()
        require("snacks").picker.files({ 
          cmd = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--color", "never" }
        })
      end,
      desc = "Find Files (including hidden)",
    },
    {
      "<leader>fh",
      function()
        require("snacks").picker.files({ 
          cmd = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--color", "never" }
        })
      end,
      desc = "Find Hidden Files",
    },
  },
}
