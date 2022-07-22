" Let ; be also :
noremap ; :

" Edit ~/.vimrc on-the-fly
nnoremap <leader>ed :split $MYVIMRC<CR>
nnoremap <leader>de :edit $MYVIMRC<CR>
nnoremap <leader>ut :edit $HOME/.config/nvim/UltiSnipCR>

" Clear searching highlight
nnoremap <silent> <leader><backspace> :noh<CR>

" Remap window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Navigation when in insert mode
imap <A-j> <C-o>j
imap <A-k> <C-o>k
imap <A-h> <C-o>h
imap <A-l> <C-o>l

" Navigate buffer
nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>
nmap <S-q> <CMD>Bdelete!<CR>

" Disable arrow
if get(g:, 'elite_mode')
    nnoremap <Up>    <C-W>+
    nnoremap <Down>  <C-W>-
    nnoremap <Left>  <C-W><
    nnoremap <Right> <C-W>>
endif

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

"---------- Drag Visual ----------
vmap K xkP`[V`]
vmap J xp`[V`]
vmap H <gv
vmap L >gv

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
map <silent> <F2> :NvimTreeToggle<CR>

" Diffview
nmap <F5> :DiffviewOpen 
map <silent> <F6> <CMD>DiffviewClose<CR>
nmap <leader>df <CMD>DiffviewFileHistory %<CR>

" Telescope
nnoremap <leader>ff <CMD>Telescope find_files<CR>
nnoremap <leader>fl <CMD>Telescope live_grep<CR>
nnoremap <leader>fg <CMD>Telescope grep_string<CR>

" toggleterm
function! SetTerminalKeymaps()
  tnoremap <C-h> <C-\><C-n><C-W>h
  tnoremap <C-j> <C-\><C-n><C-W>j
  tnoremap <C-k> <C-\><C-n><C-W>k
  tnoremap <C-l> <C-\><C-n><C-W>l
endfunction
