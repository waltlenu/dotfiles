""" NeoVim config """
set nocompatible

" ----------------------------------------------------------------------------
" Load plugins
" ----------------------------------------------------------------------------
source $XDG_CONFIG_HOME/nvim/plugin-manager.vim

" ----------------------------------------------------------------------------
" Configure plugins
" ----------------------------------------------------------------------------
source $XDG_CONFIG_HOME/nvim/plugins.vim

" ----------------------------------------------------------------------------
" Load functions
" ----------------------------------------------------------------------------
"source $XDG_CONFIG_HOME/nvim/functions.vim

" ----------------------------------------------------------------------------
" Base config
" ----------------------------------------------------------------------------

" Enable TrueColor
set termguicolors

" Colorscheme
colorscheme gruvbox

" Tab character settings
set linebreak
set scrolloff=3
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" set fillchars+=stl:\ ,stlnc:\
