vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true;

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.scrolloff = 8

vim.opt.background = "dark"
vim.opt.showmode = false
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"
vim.opt.iskeyword:append('-')

vim.g.copilot_no_tab_map = true

if vim.g.neovide == true then
    vim.o.guifont = "RobotoMono Nerd Font:h16"
end

-- Highlight on Yank
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}]]

-- Color Scheme
vim.cmd [[colorscheme tokyonight-storm]]
vim.g.tokyonight_style = "night"

-- Highlighted Line Numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#ffffff' })
