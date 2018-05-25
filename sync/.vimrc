let mapleader=" "

" NERD tree plugin
map <C-n> :NERDTreeToggle<CR>

" Set tags file location
set tags=./tags,tags;$HOME

" Disable typescript syntaxcheck on save
let g:tsuquyomi_disable_quickfix = 1

" Color scheme
set background=light
colorscheme solarized
syntax enable

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


" Remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Italic Font
" note: this has to come after the color scheme stuff is loaded
" see: https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
set t_ZH=[3m
set t_ZR=[23m
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type    cterm=italic

" Copy and past to system clipboard
set clipboard=unnamed

" Backspace behavior
set backspace=indent,eol,start

" Tab default setings. modify per filetype in ~/.vim/indent/<filetype>.vim
set textwidth=120   " break lines when line length increases
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for auto indent
set expandtab       " tabs are spaces
set autoindent

" UI config
set number              " show line numbers
set relativenumber      " show relative numbers
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
filetype plugin indent on      " load filetype-specific indent from plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" FZF search
nnoremap <leader>f :Ag .<ENTER>
nnoremap <leader>t :FZF .<ENTER>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>

nnoremap <leader><space> :noh<CR>    " Clear search highlights
