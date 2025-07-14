local M = {}

function M.basename(s)
    return s:match("^.+[\\/](.+)$") or s
end

return M
