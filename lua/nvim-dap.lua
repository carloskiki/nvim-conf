local dap = require('dap')

-- Don't go to other windows
dap.defaults.fallback.switchbuf = 'usetab,uselast'

-- Adapters setup
dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
    name = 'lldb'
}

-- Map K to hover when debugging, restore original K after debugging
local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
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
    api.nvim_set_keymap('n', '<right>', '<Cmd>lua require("dap").step_into()<CR>', { silent = true })
    api.nvim_set_keymap('n', '<left>', '<Cmd>lua require("dap").step_out()<CR>', { silent = true })
    api.nvim_set_keymap('n', '<down>', '<Cmd>lua require("dap").step_over()<CR>', { silent = true })
end

dap.listeners.after['event_terminated']['me'] = function()
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
