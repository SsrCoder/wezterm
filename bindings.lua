local wezterm = require "wezterm"
local MODS_SUPER = "SUPER"
local MODS_SUPER_CTRL = "SUPER|CTRL"
local MODS_NONE = 'NONE'

local keys = {
	-- copy / paste
	{ key = 'c', mods = MODS_SUPER,      action = wezterm.action.CopyTo('Clipboard') },
	{ key = 'v', mods = MODS_SUPER,      action = wezterm.action.PasteFrom('Clipboard') },

	-- tab move
	{ key = '[', mods = MODS_SUPER,      action = wezterm.action.ActivateTabRelative(-1) },
	{ key = ']', mods = MODS_SUPER,      action = wezterm.action.ActivateTabRelative(1) },
	{ key = '[', mods = MODS_SUPER_CTRL, action = wezterm.action.MoveTabRelative(-1) },
	{ key = ']', mods = MODS_SUPER_CTRL, action = wezterm.action.MoveTabRelative(1) },

	{ key = 'n', mods = MODS_SUPER,      action = wezterm.action.SpawnWindow },
	{ key = 'd', mods = MODS_SUPER,      action = wezterm.action.CloseCurrentPane { confirm = true } },

	{ key = 's', mods = MODS_SUPER_CTRL, action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = 'v', mods = MODS_SUPER_CTRL, action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{ key = 'h', mods = MODS_SUPER_CTRL, action = wezterm.action.ActivatePaneDirection "Left" },
	{ key = 'j', mods = MODS_SUPER_CTRL, action = wezterm.action.ActivatePaneDirection "Down" },
	{ key = 'k', mods = MODS_SUPER_CTRL, action = wezterm.action.ActivatePaneDirection "Up" },
	{ key = 'l', mods = MODS_SUPER_CTRL, action = wezterm.action.ActivatePaneDirection "Right" },
}

local mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = MODS_SUPER,
		action = wezterm.action.OpenLinkAtMouseCursor,
	}
}

return {
	keys = keys,
	mouse_bindings = mouse_bindings,
}
