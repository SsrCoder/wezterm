local wezterm = require "wezterm"

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font_with_fallback { "Fragment Mono", "LXGW WenKai", "JetBrains Mono" }
config.font_size = 14

config.window_frame = {
	font = wezterm.font { family = "Fragment Mono", weight = "Bold" },
	font_size = 12,
}

config.animation_fps = 60
config.max_fps = 60
config.automatically_reload_config = true

config.window_background_opacity = 0.9
-- 设置窗口样式，取消边框和按钮
config.window_decorations = "RESIZE"
-- 只有一个tab时隐藏顶部tab bar
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true

config.enable_scroll_bar = false

config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

config.window_close_confirmation = "NeverPrompt"

local gpus = wezterm.gui.enumerate_gpus()

if #gpus >= 1 then
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"
	config.webgpu_preferred_adapter = gpus[1]
else
	config.front_end = "Software"
end

local bindings = require "bindings"

config.keys = bindings.keys
config.mouse_bindings = bindings.mouse_bindings

return config
