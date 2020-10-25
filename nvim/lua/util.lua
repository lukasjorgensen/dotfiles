--
-- util.lua
-- Common utilities to make using lua in NeoVim more palatable
--
local cmd = vim.api.nvim_command

local util = {}

-- util.dump(o)
-- Similar to json.dump in python returns a string representation of
-- the input object
function util.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. util.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- util.create_augroups(o)
-- Create Au Groups from an input object
-- ex:
-- local autocmds = {
--     startup = {
--         {"FileType", "rust", [[setlocal omnifunc=v:lua.vim.lsp.omnifunc]]},
--         {"FileType", "json", [[syntax match Comment +\\/\\/.\\+$+]]},
--         {"FileType", "c", [[setlocal shiftwidth=4 noexpandtab]]},
--         {"FileType", "cpp", [[setlocal shiftwidth=4 noexpandtab]]},
--         {"FileType", "defx", [[lua require"config.defx".keymaps()]]}
--     }
-- }
-- require "util".create_augroups(autocmds)
function util.create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        cmd('augroup ' .. group_name)
        cmd('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            cmd(command)
        end
        cmd('augroup END')
    end
end

return util
