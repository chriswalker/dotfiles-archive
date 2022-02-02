local wezterm = require 'wezterm';

--
-- Key mappings
-- ----------------------------------------------------------------------------

-- Stores key mappings
local mymappings = {}

-- Switch to tab
for i = 1, 8 do
    table.insert(mymappings, {key = tostring(i), mods = "ALT", action = wezterm.action{ActivateTab=i-1}})
end

-- Vertical split
table.insert(mymappings, {key = "-", mods = "ALT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}});
-- Horizontal split
table.insert(mymappings, {key = "\\", mods = "ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}})

-- Move to pane
table.insert(mymappings, {key = "h", mods = "ALT", action=wezterm.action{ActivatePaneDirection="Left"}})
table.insert(mymappings, {key = "j", mods = "ALT", action=wezterm.action{ActivatePaneDirection="Down"}})
table.insert(mymappings, {key = "k", mods = "ALT", action=wezterm.action{ActivatePaneDirection="Up"}})
table.insert(mymappings, {key = "l", mods = "ALT", action=wezterm.action{ActivatePaneDirection="Right"}})

-- Resize current pane
table.insert(mymappings, {key = "H", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}})
table.insert(mymappings, {key = "J", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 2}}})
table.insert(mymappings, {key = "K", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 2}}})
table.insert(mymappings, {key = "L", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}})

-- Create new tab
table.insert(mymappings, {key="t", mods="ALT", action=wezterm.action{SpawnTab="DefaultDomain"}})

-- Increase/decrease font size
table.insert(mymappings, {key="+", mods="ALT|SHIFT", action="IncreaseFontSize"})
table.insert(mymappings, {key="_", mods="ALT|SHIFT", action="DecreaseFontSize"})

-- Toggle zoome state of current pane (maximise)
table.insert(mymappings, {key="m", mods="ALT", action="TogglePaneZoomState"}) 
    
return {
    --
    -- Appearance
    -- ------------------------------------------------------------------------ 

	-- Colour scheme
    -- ------------------------------------------------------------------------ 
    color_scheme = "nord",

    colors = {
        tab_bar = {
            background = "#3B4252",
            active_tab = {
                fg_color = "#A3BE8C",
                bg_color = "#2E3440",
                intensity = "Bold",
            },
            inactive_tab = {
                fg_color = "#D8DEE9",
                bg_color = "#3B4252",
            },
            inactive_tab_hover = {
                fg_color = "#ECEFF4",
                bg_color = "#3B4252",
                intensity = "Bold",
            },
            new_tab = {
                fg_color = "#EBCB8B",
                bg_color = "#3B4252",
                intensity = "Bold",
            },
            new_tab_hover = {
                bg_color = "#EBCB8B",
                fg_color = "#3B4252",
                intensity = "Bold",
            },
        },
        split = "#444444",
    },

    inactive_pane_hsb = {
        brightness = 0.6,
    },
    
    -- Font config
    -- ------------------------------------------------------------------------ 
    font_size = 15,

    -- Tab bar configuration
    -- ------------------------------------------------------------------------ 
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,

    window_padding = {
        left = 2,
        right = 2,
        top = 1,
        bottom = 1,
    },

    -- Key mappings
    -- ------------------------------------------------------------------------ 
    keys = mymappings,

    -- Sundries
    -- ------------------------------------------------------------------------ 
    exit_behavior = "Close",
}
