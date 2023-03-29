-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'Dracula (Official)'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.window_decorations = 'RESIZE'

config.window_close_confirmation = 'NeverPrompt'

-- WSL

config.default_domain = "WSL:ArchWSL"
config.default_prog = { "wsl.exe" } 

-- KEYS

config.keys = {
    -- This will create a new vertical split and run your default program inside it
    {
        key = '"',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- This will create a new horizontal split and run your default program inside it
    {
        key = '%',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'UpArrow',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|SHIFT',
        action = act.ActivatePaneDirection 'Down',
    },
  }

-- and finally, return the configuration to wezterm
return config