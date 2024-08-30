local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Set colors
config.color_scheme = "Catppuccin Frappe"

config.initial_cols = 176
config.initial_rows = 48

-- Fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 800

-- Hide the tab bar if there is only one tab
config.hide_tab_bar_if_only_one_tab = false

config.enable_scroll_bar = true
config.scrollback_lines = 5000

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 1

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	-- and make CMD-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = act.OpenLinkAtMouseCursor,
	},
}

return config
