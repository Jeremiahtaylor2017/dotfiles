-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Constants
local M = {}

M.bg_blurred_darker = wezterm.home_dir .. "/dotfiles/wezterm/assets/bg-blurred-darker.png"
M.bg_blurred = wezterm.home_dir .. "/dotfiles/wezterm/assets/bg-blurred.png"
M.bg_image = M.bg_blurred_darker

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
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_background_image = M.bg_image

-- Miscellaneous settings
config.prefer_egl = true

return config