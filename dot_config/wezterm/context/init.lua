local wezterm = require('wezterm') --[[@as Wezterm]]
local rules = require("context.rules")
local utils = require("context.utils")

local M = {}

function M.apply_dynamic_overrides(window, pane)
    local info = pane:get_foreground_process_info()
    wezterm.log_info("Process info: ", info)
    if not info then
        wezterm.log_info("No process info available")
        return
    end

    local process = utils.basename(info.name or "")
    local argv = table.concat(info.argv or {}, " ")
    wezterm.log_info("Process: ", process, " Args: ", argv)

    for _, rule in ipairs(rules) do
        if rule.matches(process, argv) then
            wezterm.log_info("Matched rule: ", rule.name)
            window:set_config_overrides(rule.overrides)
            return
        end
    end

    wezterm.log_info("No matching rule found")
end

return M
