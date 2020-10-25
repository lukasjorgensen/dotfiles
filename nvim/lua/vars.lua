--
-- vars.lua
-- Variables
--
local cmd = vim.api.nvim_command
local set_var = vim.api.nvim_set_var

local vars = {}

function vars.setup()
    vars.deoplete()
    vars.lightline()
    vars.material()
    vars.rust()
    vars.superTab()
    vars.terraform()
    vars.utiliSnips()
    vars.vista()
    vars.webDevIcons()
end

function vars.lightline()
    set_var('lightline#bufferline#filename_modifier', ':t')
    set_var('lightline#bufferline#clickable', 1)
    set_var('lightline#bufferline#enable_devicons', 1)
    set_var('lightline#bufferline#unicode_symbols', 1)
    set_var('lightline#bufferline#show_number', 2)
    set_var('lightline#bufferline#unnamed', '[No Name]')
    set_var('lightline', {
        active = {
            left = {{'mode', 'paste'}, {'fugitive', 'filename', 'method'}}
        },
        colorscheme = 'material_vim',
        tabline = {left = {{'buffers'}}, right = {{'close'}}},
        component_function = {
            fugitive = 'LightlineFugitive',
            filename = 'LightlineFilename',
            filetype = 'MyFiletype',
            fileformat = 'MyFiletype',
            method = 'NearestMethodOrFunction'
        },
        component_expand = {buffers = 'lightline#bufferline#buffers'},
        component_type = {buffers = 'tabsel'},
        component_raw = {buffers = 1},
        separator = {left = '', right = ''},
        subseparator = {left = '', right = ''}
    })
end

function vars.vista()
    -- set_var('vista#renderer#enable_icons', 1)
    set_var('vista_sidebar_width', 50)
    -- set_var('vista_icon_indent', {"╰─▸ ", "├─▸ "})
    set_var('vista_default_executive', 'nvim_lsp')
    set_var('vista_executive_for', {
        vimwiki = 'markdown',
        pandoc = 'markdown',
        markdown = 'toc',
        terraform = 'nvim_lsp',
        rust = 'nvim_lsp',
        lua = 'nvim_lsp'
    })
end

function vars.deoplete() set_var('deoplete#enable_at_startup', 1) end

function vars.material()
    cmd('set termguicolors')
    set_var('material_theme_style', 'palenight')
    cmd('colorscheme material')
end

function vars.rust() set_var('rustfmt_autosave', 1) end

function vars.superTab() set_var('SuperTabDefaultCompletionType', '<c-x><c-o>') end

function vars.terraform()
    set_var('terraform_fmt_on_save', 1)
    set_var('terraform_align', 1)
end

function vars.utiliSnips() set_var('UltiSnipsExpandTrigger', '<C-j>') end

function vars.webDevIcons() set_var('webdevicons_enable', 1) end

return vars
