-- Pull in the wezterm API
local wezterm = require("wezterm")

local get_random_entry = function(tbl)
	local keys = {}
	for key, _ in ipairs(tbl) do
		table.insert(keys, key)
	end
	local randomKey = keys[math.random(1, #keys)]
	return tbl[randomKey]
end

local get_font = function(fonts)
	local family = get_random_entry(fonts)
	return wezterm.font_with_fallback({
		{ family = family, weight = "Bold" },
		{ family = "Symbols Nerd Font Mono" },
	})
end

-- This table will hold the configuration.
local config = {}

local act = wezterm.action
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato (Gogh)"

-- If on windows set powershell as default prompt
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell" }
end

config.font = get_font({
	"JetBrains Mono",
	"Fira Code Nerd Font Mono",
	"Fira Code",
	"DengXian",
})

config.font_size = 20

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},
	{ key = "h", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) },
	{ key = "k", mods = "ALT", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "j", mods = "ALT", action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
}
-- and finally, return the configuration to wezterm
return config
