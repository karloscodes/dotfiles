local wezterm = require 'wezterm'

-- Get the config builder and action objects
local config = wezterm.config_builder()
local act = wezterm.action

-- Color scheme
config.color_scheme = 'Gruvbox Dark (Gogh)'

-- Font configuration
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })
config.font_size = 14.0

-- Window configuration
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = 15,
  right = 15,
  top = 10,
  bottom = 10,
}

-- Tab bar configuration with wider tabs
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.tab_max_width = 50
config.show_tab_index_in_tab_bar = true

config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font_size = 12.0,
  active_titlebar_bg = '#282828',
  inactive_titlebar_bg = '#282828',
}

-- Updated tab bar colors using Gruvbox orange
config.colors = {
  tab_bar = {
    background = '#282828',
    active_tab = {
      bg_color = '#d65d0e',
      fg_color = '#fbf1c7',
      intensity = 'Bold',
      underline = 'None',
      italic = false,
    },
    inactive_tab = {
      bg_color = '#3c3836',
      fg_color = '#a89984',
    },
    inactive_tab_edge = '#282828',
    new_tab = {
      bg_color = '#282828',
      fg_color = '#a89984',
    },
    new_tab_hover = {
      bg_color = '#504945',
      fg_color = '#ebdbb2',
    },
  },
}

-- Key bindings for splitting panes
config.keys = {
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  }
}

-- Return the configuration
return config
