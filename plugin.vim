" vim-gitgutter settings
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_max_signs = 1000
let g:gitgutter_highlight_lines = 0
let g:gitgutter_grep = 'rg'

" vim-airline settings
set noshowmode

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1

" toggleterm
autocmd! TermOpen term://* call SetTerminalKeymaps()

" treesitter-context
hi! CustomTreesitterContext gui=bold guibg=black blend=80
hi! link TreesitterContext CustomTreeSitterContext

" vim-move
let g:move_key_modifier = 'A'
let g:move_key_modifier_visualmode = 'S'
