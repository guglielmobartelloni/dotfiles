-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"


-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato (Gogh)"

local background_path = "/Users/samurai/Pictures/term-back.jpg"
-- If on windows set powershell as default prompt
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { "powershell" }
    background_path = "C:\\Users\\U479488\\" .. "Pictures\\term-back.jpg"
end

config.skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    'zsh',
    'fish',
    'tmux',
    'nu',
    'cmd.exe',
    'pwsh.exe',
    'powershell.exe',
}

config.font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Fira Code Nerd Font Mono",
    "Fira Code",
})

config.font_size = 13

local dimmer = { brightness = 0.05 }

config.background = {
    -- This is the deepest/back-most layer. It will be rendered first
    {
        source = {
            File = background_path
        },
        -- The texture tiles vertically but not horizontally.
        -- When we repeat it, mirror it so that it appears "more seamless".
        -- An alternative to this is to set `width = "100%"` and have
        -- it stretch across the display
        repeat_x = "Mirror",
        hsb = dimmer,
        -- When the viewport scrolls, move this layer 10% of the number of
        -- pixels moved by the main viewport. This makes it appear to be
        -- further behind the text.
        attachment = { Parallax = 0.1 },
    },
}

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
    -- {
    -- 	key = "b",
    -- 	mods = "LEADER|CTRL",
    -- 	action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }),
    -- },
    { key = "h", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) },
    { key = "l", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) },
    { key = "k", mods = "ALT", action = act({ ActivatePaneDirection = "Up" }) },
    { key = "j", mods = "ALT", action = act({ ActivatePaneDirection = "Down" }) },
    {
        key = "x",
        mods = "LEADER",
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = "b",
        mods = "LEADER",
        action = act.ActivateTabRelative(-1),
    },
    {
        key = "n",
        mods = "LEADER",
        action = act.ActivateTabRelative(1),
    },
    {
        key = "c",
        mods = "LEADER",
        action = act.SpawnTab("CurrentPaneDomain"),
    },
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

