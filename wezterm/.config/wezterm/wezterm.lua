-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_mouse_cursor_when_typing = false

-- This is where you actually apply your config choices
config.font_size = 9.75
config.line_height = 1.2
config.font = wezterm.font('JetBrains Mono Nerd Font')

config.window_decorations = 'RESIZE'

config.hide_tab_bar_if_only_one_tab = true

config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config
