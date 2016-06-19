" Section Mappings {{{

" remap esc
inoremap jk <esc>

" markdown to html
nmap <leader>md :%!markdown --html4tags <cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" wipout buffer
nmap <silent> <leader>b :bw<cr>

" shortcut to save
nmap <leader>, :w<cr>

" disable Ex mode
noremap Q <NOP>

" set paste toggle
set pastetoggle=<F6>

" toggle paste mode
map <leader>v :set paste!<cr>

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" edit gitconfig
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

" toggle invisible characters
set invlist
set listchars=tab:?\ ,eol:¬,trail:·,extends:?,precedes:?
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=?
nmap <leader>l :set list!<cr>

" Textmate style indentation
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

map <leader>wc :wincmd q<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

map <leader>r :call RunCustomCommand()<cr>
" map <leader>s :call SetCustomCommand()<cr>
let g:silent_custom_command = 0

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

nmap <leader>w :setf textile<cr> :Goyo<cr>

" }}}