local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "OneHalfDark"

config.font = wezterm.font("DankMalware")
config.font_size = 16.0
config.line_height = 1.5

config.underline_position = "200%"
config.underline_thickness = "1.8"

-- Cursor --
config.force_reverse_video_cursor = true
config.cursor_blink_rate = 500

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.window_padding = {
   left = 0,
   right = 0,
   top = 0,
   bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

return config
