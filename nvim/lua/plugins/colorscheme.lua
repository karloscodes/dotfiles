-- Every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },

  -- add darcula
  { "doums/darcula" },

  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night", -- storm, moon, night, day
    },
  },

  -- Configure LazyVim to load catppuccin-mocha by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
