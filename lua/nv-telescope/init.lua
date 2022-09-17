local actions = require'telescope.actions'
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    mappings = {
      n = {
        ["ZZ"] = actions.close,
        ["Q"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_soter = true
    }
  }
}
require('telescope').load_extension('fzy_native')

local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>vcg', [[<cmd>lua require('nv-telescope.utils').search_config()<CR>]], opt)
