local opt = { noremap = true, silent = true }

vim.keymap.set('n', '<Space>', '<NOP>', opt)
vim.g.mapleader = ' '

-- File explorer
vim.keymap.set('n', '<Leader>e', vim.cmd.Ex, opt)

-- no hl
vim.keymap.set('n', '<Leader>h', ':set hlsearch!<CR>', opt)

-- better window movement
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- better indenting
vim.keymap.set('v', '<', '<gv', opt)
vim.keymap.set('v', '>', '>gv', opt)

-- I hate escape
vim.keymap.set('i', 'jk', '<ESC>', opt)
vim.keymap.set('i', 'kj', '<ESC>', opt)

-- Move selected line / block of text in visual mode
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', opt)
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', opt)

-- Better Yank
vim.keymap.set('n', 'Y', 'y$', opt)

-- Center on word search
vim.keymap.set('n', 'n', 'nzzzv', opt)
vim.keymap.set('n', 'N', 'Nzzzv', opt)

-- Bufferline
vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>', opt)
vim.keymap.set('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opt)
vim.keymap.set('n', '[b', ':BufferLineMovePrev<CR>', opt)
vim.keymap.set('n', ']b', ':BufferLineMoveNext<CR>', opt)
vim.keymap.set('n', '<Leader>cb', ':bdelete<CR>', opt)

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opt)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opt)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opt)
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', opt)
vim.keymap.set('n', '<leader>vcg', function()
    require('telescope.builtin').find_files({
        prompt_title = '< VimRC >',
        cwd = '~/.config/nvim'
    })
end, opt)
vim.keymap.set('n', '<leader>fd', function()
    -- get the current directory from the buffer
    local buffer_file = vim.api.nvim_buf_get_name(0)
    local dir = vim.fn.fnamemodify(buffer_file, ":p:h")
    -- change the directory
    vim.cmd(string.format("cd %s", dir))
end, opt)

-- Github Copilot
vim.keymap.set('n', '<leader>p', ':Copilot <CR>', opt)
vim.keymap.set('i', '<C-b>', 'copilot#Accept()', { silent = true, expr = true })
vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-suggest)')

-- Lazygit with Toggleterm
vim.keymap.set("n", "<leader>g", function()
    require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" }):toggle()
end, opt)
