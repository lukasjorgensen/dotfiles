luafile ~/.config/nvim/lua/init.lua

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()


function! DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
  call nvim_win_set_var(g:float_preview#win, 'syntax', 'on')
endfunction

autocmd User FloatPreviewWinOpen call DisableExtras()

function! Syn()
 for id in synstack(line("."), col("."))
 echo synIDattr(id, "name")
 endfor
endfunction
command! -nargs=0 Syn call Syn()

set laststatus=2
packadd vim-startify
packadd lightline.vim
packadd lightline-bufferline
packadd vista.vim
packadd vimwiki
packadd vim-clap
packadd nvim-treesitter
packadd vim-polyglot
packadd nerdtree
packadd termdebug

lua require'config.defx'.setup()
