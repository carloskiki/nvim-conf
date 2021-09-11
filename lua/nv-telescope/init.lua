local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope live_grep<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope buffers<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opt)
