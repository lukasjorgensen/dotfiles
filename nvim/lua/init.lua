local cmd = vim.api.nvim_command
local set_keymap = vim.api.nvim_set_keymap
local set_var = vim.api.nvim_set_var

local pkg = require 'pkg'
local defx = require 'config.defx'
local lsp = require 'config.lsp'
local ts = require 'config.treesitter'
local keymaps = require 'keymaps'
local vars = require 'vars'
local util = require 'util'

cmd('set number')
cmd('set relativenumber')
cmd('set nowrap')
cmd('set noshowmode')
cmd('set hidden')

--cmd('set clipboard=unnamed')
cmd('set completeopt-=preview')
cmd('set mouse=a')

cmd('set splitright')
cmd('set tabstop=8')
cmd('set shiftwidth=4')
cmd('set expandtab')
cmd('set showmatch')
cmd('set cmdheight=2')
cmd('set updatetime=150')
cmd('set shortmess+=c')
cmd('set signcolumn=yes')
cmd('set modeline')
cmd('set autoread')
cmd('set modelines=5')
cmd('set wildmenu')
cmd('set laststatus=2')
cmd('set showtabline=2')
cmd('set backspace=indent,eol,start')

cmd('syntax on')
cmd('filetype off')

cmd('let g:termdebug_wide=1')
cmd('map <C-n> :NERDTreeToggle<CR>')
cmd('map <C-d> :Termdebug<CR>')

set_var('python3_host_prog', '/usr/local/bin/python3')

pkg.setup()
vars.setup()
lsp.setup()
defx.setup()
keymaps.setup()

cmd('command! PackUpdate source $MYVIMRC | lua require"pkg".packUpdate()')
cmd('command! PackClean  lua require"pkg".packClean()')
cmd('command! PackStatus lua require"pkg".packStatus()')

cmd('filetype plugin indent on')

cmd('set wildignore+=*/tmp/*,*.so,*.swp,*.zip')

cmd('autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif')
local autocmds = {
    startup = {
        {
            "FileType", "rust",
            [[set relativenumber | packadd rust | setlocal omnifunc=v:lua.vim.lsp.omnifunc]]
        }, {"FileType", "json", [[syntax match Comment +\\/\\/.\\+$+]]},
        {"FileType", "c", [[setlocal shiftwidth=4 noexpandtab]]},
        {"FileType", "cpp", [[setlocal shiftwidth=4 noexpandtab]]},
        {"FileType", "defx", [[lua require"config.defx".keymaps()]]}
    }
}

util.create_augroups(autocmds)

set_var('float_preview#docked', 0)
set_var('float_preview#max_width', 100)
set_var('float_preview#winhl', 'Normal:Pmenu,NormalNC:Pmenu')
