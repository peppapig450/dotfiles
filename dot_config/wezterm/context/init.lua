local wezterm = require('wezterm') --[[@as Wezterm]]
local rules = require("context.rules")
local utils = require("context.utils")

local M = {}

-- Utility function to recursively find the deepest process
local function get_deepest_process(info, depth)
    depth = depth or 0
    if not info or depth > 10 then
        wezterm.log_info("Max recursion depth reached or invalid process info")
        return info
    end

    -- If there are no children, this is the target process
    if not info.children or next(info.children) == nil then
        return info
    end

    -- Recurse into the first child
    for _, child_info in pairs(info.children) do
        return get_deepest_process(child_info, depth + 1)
    end
end

function M.apply_dynamic_overrides(window, pane)
    local info = pane:get_foreground_process_info()
    wezterm.log_info("Process info: ", info)
    if not info then
        wezterm.log_info("No process info available")
        return
    end

    -- Go to the deepest child process
    local target_info = get_deepest_process(info)
    local process = utils.basename(target_info.name or "")
    local argv = table.concat(target_info.argv or {}, " ")

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
