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
      no_italic = true, -- Disable italics globally
      no_bold = false, -- Keep bold text
      styles = {
        comments = { "italic" }, -- Keep italics only for comments
        conditionals = {}, -- Remove italics from conditionals
        loops = {}, -- Remove italics from loops
        functions = {}, -- Remove italics from functions
        keywords = {}, -- Remove italics from keywords
        strings = {}, -- Remove italics from strings
        variables = {}, -- Remove italics from variables
        numbers = {}, -- Remove italics from numbers
        booleans = {}, -- Remove italics from booleans
        properties = {}, -- Remove italics from properties
        types = {}, -- Remove italics from types
        operators = {}, -- Remove italics from operators
      },
      custom_highlights = function(colors)
        return {
          -- Make text generally bolder/thicker
          Normal = { fg = colors.text, bg = colors.base, style = { "bold" } },
          -- Make function names bolder
          Function = { fg = colors.blue, style = { "bold" } },
          -- Make keywords bolder
          Keyword = { fg = colors.mauve, style = { "bold" } },
          -- Make types bolder
          Type = { fg = colors.yellow, style = { "bold" } },
          -- Make identifiers bolder
          Identifier = { fg = colors.flamingo, style = { "bold" } },
          -- Make strings bolder
          String = { fg = colors.green, style = { "bold" } },
          -- Make constants bolder
          Constant = { fg = colors.peach, style = { "bold" } },
        }
      end,
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
