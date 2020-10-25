local set_keymap = vim.api.nvim_set_keymap
local buf_set_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.api.nvim_command

local keymaps = {}

function keymaps.setup()
    keymaps.clap()
    keymaps.navigation()
end

function keymaps.clap()
    set_keymap('n', '<leader><CR>', ':<C-u>Clap<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<C-p>', ':<C-u>Clap files<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<C-a>', ':<C-u>Clap buffers<CR>',
               {silent = true, noremap = true})
end

function keymaps.navigation()
    -- Set Leader to Spacebar
    set_keymap('', '<Space>,', '<Nop>', {silent = true, noremap = true})
    cmd('let mapleader = " "')

    set_keymap('n', "<Leader>1", "call lightline#bufferline#go(1)", {})
    set_keymap('n', "<Leader>2", "call lightline#bufferline#go(2)", {})
    set_keymap('n', "<Leader>3", "call lightline#bufferline#go(3)", {})
    set_keymap('n', "<Leader>4", "call lightline#bufferline#go(4)", {})
    set_keymap('n', "<Leader>5", "call lightline#bufferline#go(5)", {})
    set_keymap('n', "<Leader>6", "call lightline#bufferline#go(6)", {})
    set_keymap('n', "<Leader>7", "call lightline#bufferline#go(7)", {})
    set_keymap('n', "<Leader>8", "call lightline#bufferline#go(8)", {})
    set_keymap('n', "<Leader>9", "call lightline#bufferline#go(9)", {})
    set_keymap('n', "<Leader>0", "call lightline#bufferline#go(10)", {})

    -- Pane switching
    set_keymap('n', '<C-J>,', '<C-W><C-J>', {silent = true, noremap = true})
    set_keymap('n', '<C-K>,', '<C-W><C-K>', {silent = true, noremap = true})
    set_keymap('n', '<C-L>,', '<C-W><C-L>', {silent = true, noremap = true})
    set_keymap('n', '<C-H>,', '<C-W><C-H>', {silent = true, noremap = true})

    -- Pane resizing
    set_keymap('n', '<leader>,', ':vertical resize +5<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<leader>.', ':vertical resize -5<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<leader><', ':vertical resize +10<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<leader>>', ':vertical resize -10<CR>',
               {silent = true, noremap = true})

    -- Buffer navigation
    set_keymap('n', '<leader>h', ':bp<CR>', {silent = true})
    set_keymap('n', '<leader>l', ':bn<CR>', {silent = true})

    -- jj to exit insert mode
    set_keymap('i', 'jj', '<Esc>', {})

    -- Exit Term node with ESC
    set_keymap('t', '<Esc>', '<C-\\><C-N>', {noremap = true})

    set_keymap('n', '<C-t>', ':Vista!!<CR>', {silent = true, noremap = true})
end

return keymaps
