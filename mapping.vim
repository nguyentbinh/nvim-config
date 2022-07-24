" Let ; be also :
noremap ; :

" Edit ~/.vimrc on-the-fly
nnoremap <leader>ed :split $MYVIMRC<CR>
nnoremap <leader>de :edit $MYVIMRC<CR>

" Clear searching highlight
nnoremap <silent> <leader><backspace> :noh<CR>

" Remap window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Disable arrow
nnoremap <Up>    <C-W>+
nnoremap <Down>  <C-W>-
nnoremap <Left>  <C-W><
nnoremap <Right> <C-W>>

"---------- Highlight next search matching ----------

function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let blinks = 3
  let ring = matchadd('DiffDelete', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

nnoremap <silent> n n:call HLNext(0.2)<CR>
nnoremap <silent> N N:call HLNext(0.2)<CR>

"---------- Surround Shortcuts ----------

" Surround a word(s) with double-quotes
nmap <leader>" ysiw"
vmap <leader>" S"

" Surround a word(s) with single-quotes
nmap <leader>' ysiw'
vmap <leader>' S'

" Surround a word(s) with parentheses
nmap <leader>( ysiw(
nmap <leader>) ysiw)
vmap <leader>( S(
vmap <leader>) S)

" Surround a word(s) with brackets
nmap <leader>[ ysiw[
nmap <leader>] ysiw]
vmap <leader>[ S[
vmap <leader>] S]

" Surround a word(s) with braces
nmap <leader>{ ysiw{
nmap <leader>} ysiw}
vmap <leader>{ S{
vmap <leader>} S}

"-------------------------------

" Map copy and paste to clipboard
vmap <leader>y "+y
vmap <leader>d "+d

nmap <leader>p "+p
nmap <leader>P "+P

"-------------------------------
" ---SPECIFIC PLUGIN MAPPING ---
"-------------------------------

" NvimTree toggle
noremap <silent> <F2> <CMD>NvimTreeToggle<CR>

" Diffview
nnoremap <F5> :DiffviewOpen 
noremap <silent> <leader>dc <CMD>DiffviewClose<CR>
nnoremap <silent> <leader>df <CMD>DiffviewFileHistory %<CR>

" Telescope
nnoremap <leader>ff <CMD>Telescope find_files<CR>
nnoremap <leader>fl <CMD>Telescope live_grep<CR>
nnoremap <leader>fg <CMD>Telescope grep_string<CR>
nnoremap gr <CMD>Telescope lsp_references<CR>

" toggleterm
function! SetTerminalKeymaps()
  tnoremap <ESC> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-W>h
  tnoremap <C-j> <C-\><C-n><C-W>j
  tnoremap <C-k> <C-\><C-n><C-W>k
  tnoremap <C-l> <C-\><C-n><C-W>l
endfunction

" bufferline
nnoremap <silent> <S-q> <CMD>bdelete!<CR>
nnoremap <silent> <S-h> <CMD>BufferLineCyclePrev<CR>
nnoremap <silent> <S-l> <CMD>BufferLineCycleNext<CR>
nnoremap <silent> [b <CMD>BufferLineMovePrev<CR>
nnoremap <silent> ]b <CMD>BufferLineMoveNext<CR>

nnoremap <silent><leader>1 <CMD>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <CMD>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <CMD>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <CMD>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <CMD>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <CMD>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <CMD>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <CMD>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <CMD>BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>$ <CMD>BufferLineGoToBuffer -1<CR>
