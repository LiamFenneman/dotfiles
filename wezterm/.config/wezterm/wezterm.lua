local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono", { weight = 500 })
config.font_size = 12

config.color_scheme = "Tokyo Night"

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_close_confirmation = "NeverPrompt"

return config
