let mapleader=" "

" set tags file location
set tags=./tags,tags;$HOME

" disable typescript syntaxcheck on save
let g:tsuquyomi_disable_quickfix = 1

" color scheme
set background=light
colorscheme solarized
syntax enable

" copy and past to system clipboard
set clipboard=unnamed

" backspace behavior
set backspace=indent,eol,start

" indentation defaults - modify per filetype in ~/.vim/indent/<filetype>.vim
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" UI config
set number
set relativenumber
set showcmd
set showmatch

" load filetype-specific indent from plugin files
filetype plugin indent on

" autocomplete
set wildmenu
set wildmode=longest:full,full

" search
set incsearch
set hlsearch
" clear search highlight
nnoremap <leader><space> :noh<CR>

" FZF fuzzy text search
nnoremap <leader>t :FZF .<ENTER>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>

" change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  " Vertical bar in insert mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " Block in normal mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

