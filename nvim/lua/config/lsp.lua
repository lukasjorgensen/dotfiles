--
-- lsp.lua
-- Configuration information for nvim-lsp
--
local cmd = vim.api.nvim_command
local set_keymap = vim.api.nvim_set_keymap

cmd("packadd nvim-lsp")

local lsp = {nvim_lsp = require 'nvim_lsp'}

function lsp.setup()
    lsp.nvim_lsp.clangd.setup({})
    lsp.nvim_lsp.dockerls.setup({})
    lsp.nvim_lsp.jsonls.setup({})
    lsp.nvim_lsp.pyls.setup({})
    lsp.nvim_lsp.rust_analyzer.setup({})
    lsp.nvim_lsp.sumneko_lua.setup({})
    lsp.nvim_lsp.terraformls.setup({})
    lsp.nvim_lsp.vimls.setup({})

    lsp.keymaps()
    lsp.set_signs()
end

function lsp.set_signs()
    cmd("sign define LspDiagnosticsErrorSign text=")
    cmd("sign define LspDiagnosticsWarningSign text=")
    cmd("sign define LspDiagnosticsInformationSign text=")
    cmd("sign define LspDiagnosticsHintSign text=")
end

function lsp.keymaps()
    set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>',
               {silent = true, noremap = true})
    set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>',
               {silent = true, noremap = true})
    set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
               {silent = true, noremap = true})
    set_keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
               {silent = true, noremap = true})
    set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
               {silent = true, noremap = true})
end

return lsp
