" vim-gitgutter settings
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_max_signs = 1000
let g:gitgutter_highlight_lines = 0
let g:gitgutter_grep = 'rg'

" toggleterm
autocmd! TermOpen term://* call SetTerminalKeymaps()

" treesitter-context
hi! CustomTreesitterContext gui=bold guibg=black blend=80
hi! link TreesitterContext CustomTreeSitterContext

" vim-move
let g:move_key_modifier = 'A'
let g:move_key_modifier_visualmode = 'S'
