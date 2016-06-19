" Section AutoGroups {{{

" file type specific settings
augroup configgroup
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
    autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType *.md.js :call SyntasticReset<cr>
    autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell
    autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
    autocmd FileType crontab setlocal nobackup nowritebackup

    " automatically resize panes on resize
    autocmd VimResized * exe 'normal! \<c-w>='
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimrc.local source %
    " save all files on focus lost, ignoring warnings about untitled buffers
    autocmd FocusLost * silent! wa

    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd BufNewFile,BufRead .babelrc set filetype=json
    autocmd BufNewFile,BufRead .jshintrc set filetype=json
    autocmd BufNewFile,BufRead .eslintrc set filetype=json
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript

    " make quickfix windows take all the lower section of the screen
    " when there are multiple windows open
    autocmd FileType qf wincmd J

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

    " autocmd! BufEnter * call ApplyLocalSettings(expand('<afile>:p:h'))

    autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

    autocmd! BufWritePost * Neomake
augroup END

" }}}

" Section User Interface {{{

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1


set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" switch syntax highlighting on
syntax on

set encoding=utf8
let base16colorspace=256  " access colors present in 256 colorspace
set t_Co=256 " explicitly tell vim that the terminal supports 256 colors
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
highlight Comment cterm=italic
highlight htmlArg cterm=italic

set number " show line numbers
" set relativenumber " show relative line numbers
highlight LineNr term=NONE " don't highlight line numbers

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent

" }}}