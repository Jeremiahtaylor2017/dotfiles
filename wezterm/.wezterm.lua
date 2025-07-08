-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Config goes in between
-- Font settings
config.font_size = 14
config.line_height = 1.1
config.font = wezterm.font("JetBrains Mono")

-- Colors
config.colors = {
    cursor_bg = "white",
    cursor_border = "white",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

return config