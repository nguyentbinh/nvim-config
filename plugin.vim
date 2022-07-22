let g:python3_host_prog = $HOME.'/.local/share/nvim/python-env/bin/python'

set completeopt=menu,menuone,noselect

" vim-gitgutter settings
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_max_signs = 1000
let g:gitgutter_highlight_lines = 0
let g:gitgutter_grep = 'rg'

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<C-y>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" delimitMate settings
let delimitMate_expand_cr = 2

" vim-airline settings
set noshowmode

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0

let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1

" NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" toggleterm
autocmd! TermOpen term://* call SetTerminalKeymaps()
