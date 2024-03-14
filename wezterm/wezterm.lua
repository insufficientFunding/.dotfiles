local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "OneDark (base16)"
--config.window_background_opacity = 0.95

config.font = wezterm.font_with_fallback({
	{ family = "MonoLisa", weight = "Light" },
	{ family = "Hack Nerd Font", scale = 0.9 },
})

config.font_size = 16.0
config.line_height = 1.15

config.freetype_load_target = "Light"

config.use_cap_height_to_scale_fallback_fonts = false

config.underline_position = "200%"
config.underline_thickness = "1.3"

config.warn_about_missing_glyphs = false

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
