vim.opt.wrap=false                              -- Display long lines as just one line
vim.opt.encoding="utf-8"                      -- The encoding displayed
vim.opt.pumheight=10                        -- Makes popup menu smaller
vim.opt.fileencoding="utf-8"                  -- The encoding written to file
vim.opt.ruler=true              		  --                 " Show the cursor position all the time
vim.opt.cmdheight=2                         -- More space for displaying messages
vim.opt.mouse="a"                             -- Enable your mouse
vim.opt.splitbelow=true                          -- Horizontal splits will automatically be below
vim.opt.splitright=true                          -- Vertical splits will automatically be to the right
vim.opt.conceallevel=0                      -- So that I can see `` in markdown files
vim.opt.tabstop=2                           -- Insert 2 spaces for a tab
vim.opt.shiftwidth=2                        -- Change the number of space characters inserted for indentation
vim.opt.smarttab=true                            -- Makes tabbing smarter will realize you have 2 vs 4
vim.opt.expandtab=true                           -- Converts tabs to spaces
vim.opt.smartindent=true                         -- Makes indenting smart
vim.opt.autoindent=true                          -- Good auto indent
vim.opt.number=true                              -- Line numbers
-- vim.opt.cursorline=true                          -- Enable highlighting of the current line
vim.opt.background="dark"                     -- tell vim what the background color looks like
vim.opt.showtabline=2                       -- Always show tabs
vim.opt.showmode=false			  -- We don't need to see things like -- INSERT -- anymore
vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.updatetime=300                      -- Faster completion
vim.opt.timeoutlen=500                      -- By default timeoutlen is 1000 ms
vim.opt.clipboard="unnamedplus"               -- Copy paste between vim and everything else
vim.opt.autochdir=true                           -- Your working directory will always be the same as your working directory
vim.opt.iskeyword:append('-')
vim.opt.hidden = true
vim.opt.termguicolors=true

-- remove continuation of comments to next line

-- Color Scheme
vim.g.onedark_transparent_background = true
-- vim.cmd[[colorscheme onedark]]
vim.cmd[[autocmd BufNewFile,BufRead * setlocal formatoptions-=cro]]
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_transparent = true
-- vim.cmd[[au colorscheme * hi Normal ctermbg=none guibg=none]]


vim.g.tokyonight_style = "storm"
