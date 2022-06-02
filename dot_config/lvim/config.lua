--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = true

-- appearance
lvim.colorscheme = "gruvbox"
lvim.builtin.lualine.style = "default"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "dockerfile",
  "go",
  "hcl",
  "json",
  "lua",
  "make",
  "markdown",
  "python",
  "regex",
  "rust",
  "vim",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

-- Additional Plugins
lvim.plugins = {
  -- colorscheme
  {"gruvbox-community/gruvbox"},
  -- trim trailing whitespaces and lines
  {"cappyzawa/trim.nvim"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
