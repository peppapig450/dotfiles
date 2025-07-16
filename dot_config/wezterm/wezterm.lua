local wezterm = require('wezterm') --[[@as Wezterm]]
local context = require('context')

local act = wezterm.action
local gpus = wezterm.gui.enumerate_gpus()

local config = wezterm.config_builder()

config.max_fps = 70
config.enable_wayland = true
config.prefer_egl = true
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- cursor
config.animation_fps = 1
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 650


config.check_for_updates = false
config.use_ime = true
config.ime_preedit_rendering = "Builtin"

config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.75

config.color_scheme = "Catppuccin Macchiato"

wezterm.on("apply-dynamic-overrides", function(window, pane)
    context.apply_dynamic_overrides(window, pane)
end)

config.keys = {
    {
        key = "t",
        mods = "CTRL|ALT",
        action = wezterm.action_callback(function(window, pane)
            context.apply_dynamic_overrides(window, pane)
        end),
    }
}

return config
