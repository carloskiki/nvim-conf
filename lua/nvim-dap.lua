local dap = require('dap')

-- Don't open terminal as split window
dap.defaults.fallback.terminal_win_cmd = 'enew'

-- Adapters setup
dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
    name = 'lldb'
}

-- Map K to hover when debugging, restore original K after debugging
local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['keymap_k'] = function()
    for _, buf in pairs(api.nvim_list_bufs()) do
        local keymaps = api.nvim_buf_get_keymap(buf, 'n')
        for _, keymap in pairs(keymaps) do
            if keymap.lhs == "K" then
                table.insert(keymap_restore, keymap)
                api.nvim_buf_del_keymap(buf, 'n', 'K')
            end
        end
    end
    api.nvim_set_keymap('n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
end


dap.listeners.after['event_terminated']['keymap_k'] = function()
    for _, keymap in pairs(keymap_restore) do
        if keymap.rhs then
            api.nvim_buf_set_keymap(
                keymap.buffer,
                keymap.mode,
                keymap.lhs,
                keymap.rhs,
                { silent = keymap.silent == 1 }
            )
        elseif keymap.callback then
            vim.keymap.set(
                keymap.mode,
                keymap.lhs,
                keymap.callback,
                { buffer = keymap.buffer, silent = keymap.silent == 1 }
            )
        end
    end
    keymap_restore = {}
end

local debug_opened_buffers = {}
local pre_debug_buffers = {}

-- Capture all current buffers when debugging starts
dap.listeners.before.event_initialized["record_existing_buffers"] = function()
    pre_debug_buffers = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            pre_debug_buffers[buf] = true
        end
    end
end

-- Track newly opened buffers on stop (step into, breakpoint, etc.)
dap.listeners.after.event_stopped["track_new_buffers"] = function()
    vim.defer_fn(function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.api.nvim_buf_is_loaded(buf) and not pre_debug_buffers[buf] then
            debug_opened_buffers[buf] = true
        end
    end, 50)
end

-- Hook into terminated event to clean up buffers
local function cleanup_debug_buffers()
    for buf, _ in pairs(debug_opened_buffers) do
        if vim.api.nvim_buf_is_loaded(buf) then
            -- Only close if buffer is not modified
            if not vim.bo[buf].modified then
                vim.api.nvim_buf_delete(buf, { force = false })
            end
        end
    end
    debug_opened_buffers = {} -- reset
    pre_debug_buffers = {}    -- reset
end

dap.listeners.after.event_terminated["close_debug_buffers"] = cleanup_debug_buffers
dap.listeners.after.event_exited["close_debug_buffers"] = cleanup_debug_buffers
