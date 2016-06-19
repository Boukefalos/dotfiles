" Section Plugins {{{

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" remove some files by extension
let NERDTreeIgnore = ['\.js.map$']
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>

" toggle Limelight
nmap <leader>f :Limelight!!<cr>

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
\ }

let g:neomake_typescript_tsc_maker = {
    \ 'args': ['-m', 'commonjs', '--noEmit' ],
    \ 'append_file': 0,
    \ 'errorformat':
        \ '%E%f %#(%l\,%c): error %m,' .
        \ '%E%f %#(%l\,%c): %m,' .
        \ '%Eerror %m,' .
        \ '%C%\s%\+%m'
\ }

" autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']

" CtrlP ignore patterns
" let g:ctrlp_custom_ignore = {
"             \ 'dir': '\.git$\|node_modules$\|bower_components$\|\.hg$\|\.svn$',
"             \ 'file': '\.exe$\|\.so$'
"             \ }
" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2


" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0


let g:SuperTabCrMapping = 0

if (has("gui_running"))
    set guioptions=egmrt
    set background=light
    colorscheme solarized
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_powerline_fonts=0
    let g:airline_theme='solarized'
endif

call ApplyLocalSettings(expand('.'))

" }}}