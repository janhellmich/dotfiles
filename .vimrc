execute pathogen#infect() 
let mapleader=","       " leader is comma

" NERD tree plugin
map <C-n> :NERDTreeToggle<CR>

" CtrlP search
nnoremap <leader>f :CtrlP .<ENTER>

" Set tags file location
set tags=./.tags;/

" Color scheme
set background=dark
colorscheme solarized

" Copy and past to system clipboard
set clipboard=unnamed

" Backspace behavior
set backspace=indent,eol,start

" Tab default setings. modify per filetype in ~/.vim/indent/<filetype>.vim
set textwidth=120   " break lines when line length increases
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for auto indent
set expandtab       " tabs are spaces
set autoindent

" UI config
syntax enable           " enable syntax highlighting
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>
