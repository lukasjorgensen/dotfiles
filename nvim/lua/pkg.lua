--
-- pkg.lua
-- Package Management
--
local call_fn = vim.api.nvim_call_function
local cmd = vim.api.nvim_command

local pkg = {
    packages = {
        {"k-takata/minpac", {['type'] = 'opt'}},
        {"mhinz/vim-startify", {['type'] = 'opt'}},
        {"itchyny/lightline.vim", {['type'] = 'opt'}}, {"tpope/vim-surround"},
        {"tpope/vim-fugitive", {['type'] = 'opt'}}, {"tpope/vim-commentary"},
        {"townk/vim-autoclose"}, {"AndrewRadev/splitjoin.vim"},
        {"honza/vim-snippets"}, {"rust-lang/rust.vim", {['type'] = 'opt'}},
        {"sheerun/vim-polyglot"},
        {"ayu-theme/ayu-vim"},
        {"hashivim/vim-terraform", {['type'] = 'opt'}}, {"fatih/vim-go"},
        {"tpope/vim-fugitive"}, {"tpope/vim-dispatch"},
        {"vimwiki/vimwiki", {['type'] = 'opt'}},
        {"puremourning/vimspector", {['type'] = 'opt'}}, {"neovim/nvim-lsp"}, {"nvim-treesitter/nvim-treesitter"}, {"preservim/nerdtree"},
        {"Shougo/deoplete-lsp"}, {"kaicataldo/material.vim"},
        {'Shougo/deoplete.nvim', {['do'] = ':UpdateRemotePlugins'}},
        {'Shougo/defx.nvim', {["do"] = ":UpdateRemotePlugins"}},
        {
            "liuchengxu/vim-clap", {['type'] = 'opt'},
            {["do"] = ":Clap install-binary"}
        }, {"mengelbrecht/lightline-bufferline", {['type'] = 'opt'}},
        {"liuchengxu/vista.vim", {['type'] = 'opt'}},
        {"ncm2/float-preview.nvim"}, {"kristijanhusak/defx-icons"}, {
            "glacambre/firenvim",
            {
                ["type"] = "opt",
                ["do"] = "packadd firenvim | call firenvim#install(0)"
            }
        }, {"pechorin/any-jump.nvim"}, {"ryanoasis/vim-devicons"}
    }
}

function pkg.setup()
    cmd('packadd minpac')
    call_fn('minpac#init', {})

    for _, p in ipairs(pkg.packages) do call_fn('minpac#add', p) end
end

function pkg.packUpdate()
    pkg.setup()
    call_fn('minpac#update', {''})
    call_fn('minpac#status', {})
end

function pkg.packClean()
    pkg.setup()
    call_fn('minpac#clean', {})
end

function pkg.packStatus()
    pkg.setup()
    call_fn('minpac#status', {})
end

return pkg
