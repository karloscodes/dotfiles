return {
  "folke/snacks.nvim",
  -- this file is *added* to Lazy’s spec list, nothing else changes
  opts = {
    -----------------------------------------------------------------
    -- 1️⃣  Explorer panel  (<leader>e)
    -----------------------------------------------------------------
    explorer = {
      hidden  = true,   -- list .* files immediately
      ignored = true,   -- list .gitignored content too
    },

    -----------------------------------------------------------------
    -- 2️⃣  All file-pickers  (<leader><space>, <leader>ff, etc.)
    -----------------------------------------------------------------
    picker = {
      hidden  = true,   -- show dot-files
      ignored = true,   -- show ignored files
      -- you can be even more specific per-source:
      sources = {
        files = { hidden = true, ignored = true },
      },
    },  
  },
}
