vim.keymap.set('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- File explorer
vim.keymap.set('n', '<Leader>e', vim.cmd.Ex, { noremap = true, silent = true })

-- no hl
vim.keymap.set('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

-- better window movement
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- better indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- I hate escape
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<ESC>', { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.keymap.set('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true })
vim.keymap.set('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true })

-- Better Yank
vim.keymap.set('n', 'Y', 'y$', { noremap = true, silent = true })

-- Center on word search
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Bufferline
vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>cb', ':bdelete<CR>', { noremap = true, silent = true })

-- Telescope
local opt = { noremap = true, silent = true }
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

