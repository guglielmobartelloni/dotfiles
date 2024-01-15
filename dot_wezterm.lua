-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato (Gogh)'

-- If on windows set powershell as default prompt
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'powershell' }
end
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10.0

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '%',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
}
-- and finally, return the configuration to wezterm
return config
