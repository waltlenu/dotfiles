-- Custom settings
vim.opt.relativenumber = true

-- General colorscheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Status line configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
}
