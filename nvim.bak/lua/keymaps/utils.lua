local M = {}

--- Navigate left and right by n places in the bufferline
-- @param n number The number of tabs to navigate to (positive = right, negative = left)
function M.nav(n)
    local current = vim.api.nvim_get_current_buf()
    if vim.t.bufs == nil then vim.t.bufs = {} end
    for i, v in ipairs(vim.t.bufs) do
        if current == v then
            vim.cmd.b(vim.t.bufs[(i + n - 1) % #vim.t.bufs + 1])
            break
        end
    end
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
    return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

--- Close a given buffer
---@param bufnr? number The buffer to close or the current buffer if not provided
---@param force? boolean Whether or not to foce close the buffers or confirm changes (default: false)
function M.close(bufnr, force)
    print("Close")
    if force == nil then force = false end
    if M.is_available "bufdelete.nvim" then
        require("bufdelete").bufdelete(bufnr, force)
    else
        vim.cmd((force and "bd!" or "confirm bd") .. (bufnr == nil and "" or bufnr))
    end
end

function M.diagnostic_goto(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

return M
